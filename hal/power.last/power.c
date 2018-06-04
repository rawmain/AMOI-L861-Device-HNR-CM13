/*
 * Copyright (C) 2016 CyanogenMod
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
#include <errno.h>
#include <string.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <fcntl.h>

#define LOG_TAG "MTK PowerHAL"
#include <utils/Log.h>

#include <hardware/hardware.h>
#include <hardware/power.h>

#include "power.h"

#define MT_HPS_PATH "/proc/hps/"
#define MT_RUSH_BOOST_PATH "/proc/hps/rush_boost_enabled"
#define MT_FPS_UPPER_BOUND_PATH "/sys/kernel/debug/ged/hal/custom_upbound_gpu_freq"


#define CPUFREQ_PATH "/sys/devices/system/cpu/cpu0/cpufreq/"
#define INTERACTIVE_PATH "/sys/devices/system/cpu/cpufreq/interactive/"

#define GPUFREQ_PATH "/proc/gpufreq/"

#define CPU_PATH "/proc/cpufreq/"

#define POWER_HINT_POWER_SAVING 0x00000101
#define POWER_HINT_PERFORMANCE_BOOST 0x00000102
#define POWER_HINT_BALANCE  0x00000103

int low_power = 0;

static pthread_mutex_t lock = PTHREAD_MUTEX_INITIALIZER;
static int boostpulse_fd = -1;

static int current_power_profile = -1;
static int requested_power_profile = -1;


static int sysfs_write_str(char *path, char *s)
{
    char buf[80];
    int len;
    int ret = 0;
    int fd;

    fd = open(path, O_WRONLY);
    if (fd < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error opening %s: %s\n", path, buf);
        return -1 ;
    }

    len = write(fd, s, strlen(s));
    if (len < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error writing to %s: %s\n", path, buf);
        ret = -1;
    }

    close(fd);

    return ret;
}

static int sysfs_write_int(char *path, int value)
{
    char buf[80];
    snprintf(buf, 80, "%d", value);
    return sysfs_write_str(path, buf);
}

static int is_profile_valid(int profile)
{
    return profile >= 0 && profile < PROFILE_MAX;
}

static void power_fwrite(const char *path, char *s)
{
    char buf[64];
    int len;
    int fd = open(path, O_WRONLY);

    if (fd < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error opening %s: %s\n", path, buf);
        return;
    }

    len = write(fd, s, strlen(s));
    if (len < 0) {
        strerror_r(errno, buf, sizeof(buf));
        ALOGE("Error writing to %s: %s\n", path, buf);
    }

    close(fd);
}

static void power_init( __attribute__((unused)) struct power_module *module)
{
ALOGI("MTK PowerHAL INIT");
    sysfs_write_int(MT_HPS_PATH "up_threshold",99);
    sysfs_write_int(MT_HPS_PATH "down_threshold",90);
    sysfs_write_int(MT_HPS_PATH "rush_boost_enabled",0);
    sysfs_write_int(MT_HPS_PATH "input_boost_enabled",0);
    sysfs_write_int(GPUFREQ_PATH "gpufreq_input_boost",0);
}

static void power_set_interactive(__attribute__((unused)) struct power_module *module, int on)
{
    if (!is_profile_valid(current_power_profile)) {
        ALOGD("%s: no power profile selected yet", __func__);
        return;
    }

    if (on) {
        sysfs_write_int(INTERACTIVE_PATH "hispeed_freq",
                        profiles[current_power_profile].hispeed_freq);
        sysfs_write_int(INTERACTIVE_PATH "go_hispeed_load",
                        profiles[current_power_profile].go_hispeed_load);
        sysfs_write_str(INTERACTIVE_PATH "target_loads",
                        profiles[current_power_profile].target_loads);
        sysfs_write_int(CPUFREQ_PATH "scaling_min_freq",
                        profiles[current_power_profile].scaling_min_freq);
    } else {
        sysfs_write_int(INTERACTIVE_PATH "hispeed_freq",
                        profiles[current_power_profile].hispeed_freq_off);
        sysfs_write_int(INTERACTIVE_PATH "go_hispeed_load",
                        profiles[current_power_profile].go_hispeed_load_off);
        sysfs_write_str(INTERACTIVE_PATH "target_loads",
                        profiles[current_power_profile].target_loads_off);
        sysfs_write_int(CPUFREQ_PATH "scaling_min_freq",
                        profiles[current_power_profile].scaling_min_freq_off);
    } 
}

static int boostpulse_open()
{
    pthread_mutex_lock(&lock);
    if (boostpulse_fd < 0) {
        boostpulse_fd = open(INTERACTIVE_PATH "boostpulse", O_WRONLY);
    }
    pthread_mutex_unlock(&lock);

    return boostpulse_fd;
}

static void set_power_profile(int profile)
{
    if (!is_profile_valid(profile)) {
        ALOGE("%s: unknown profile: %d", __func__, profile);
        return;
    }

    if (profile == current_power_profile)
        return;

    ALOGD("%s: setting profile %d", __func__, profile);
    ALOGD("%s: setting profile Freq %d", __func__, profiles[profile].scaling_max_freq);
    sysfs_write_str(INTERACTIVE_PATH "above_hispeed_delay", profiles[profile].above_hispeed_delay);
    sysfs_write_int(INTERACTIVE_PATH "boost", profiles[profile].boost);
    sysfs_write_int(INTERACTIVE_PATH "boostpulse_duration", profiles[profile].boostpulse_duration);
    sysfs_write_int(INTERACTIVE_PATH "go_hispeed_load", profiles[profile].go_hispeed_load);
    sysfs_write_int(INTERACTIVE_PATH "hispeed_freq", profiles[profile].hispeed_freq);
    sysfs_write_int(INTERACTIVE_PATH "io_is_busy", profiles[profile].io_is_busy);
    sysfs_write_int(INTERACTIVE_PATH "min_sample_time", profiles[profile].min_sample_time);
     // sysfs_write_int(INTERACTIVE_PATH "sampling_down_factor", profiles[profile].sampling_down_factor);
    sysfs_write_str(INTERACTIVE_PATH "target_loads", profiles[profile].target_loads);
    sysfs_write_int(CPUFREQ_PATH "scaling_max_freq", profiles[profile].scaling_max_freq);
    sysfs_write_int(CPU_PATH "cpufreq_limited_max_freq_by_user",profiles[profile].scaling_max_freq);
    sysfs_write_int(CPUFREQ_PATH "scaling_min_freq", profiles[profile].scaling_min_freq);
    // thermal cpu turbo mode
    sysfs_write_int(CPU_PATH "cpufreq_turbo_mode", profiles[profile].cpufreq_turbo_mode);
    // gpufreq
    sysfs_write_int(GPUFREQ_PATH "gpufreq_opp_max_freq", profiles[profile].gpu_opp_max_freq);
    current_power_profile = profile;
}

static void set_cpuboost(){
	    if (!is_profile_valid(current_power_profile)) {
            ALOGD("%s: no power profile selected yet", __func__);
            return;
           }
        if (!profiles[current_power_profile].boostpulse_duration)
              return;
        if (boostpulse_open() >= 0) {
            int len = write(boostpulse_fd, "1", 2);
            if (len < 0) {
                ALOGE("Error writing to boostpulse: %s\n", strerror(errno));

                pthread_mutex_lock(&lock);
                close(boostpulse_fd);
                boostpulse_fd = -1;
                pthread_mutex_unlock(&lock);
            }
            //ALOGI("POWER_HINT_CPU_BOOST executed");
        }
	}

/* static void power_hint(struct power_module *module, power_hint_t hint,
                       void *data) { */

static void power_hint( __attribute__((unused)) struct power_module *module,
                        __attribute__((unused)) power_hint_t hint,
                        __attribute__((unused)) void *data) {
    int var = 0;
    char * packageName;
    int pid = 0;						
    switch (hint) {
    case POWER_HINT_LOW_POWER:
        //ALOGI("POWER_HINT_LOW_POWER");
        low_power = data == NULL ? 0 : 1;
        if (low_power == 1){
            //power_fwrite(MT_FPS_UPPER_BOUND_PATH, "0");
            power_fwrite(MT_RUSH_BOOST_PATH, "0");
        } else {
            //power_fwrite(MT_FPS_UPPER_BOUND_PATH, "4");
            power_fwrite(MT_RUSH_BOOST_PATH, "1");
        }
        break; 
    case POWER_HINT_VSYNC:
        break;
    case POWER_HINT_INTERACTION:
        /*
        if(data != NULL){
			var = *(int *) data;
			}
		ALOGI("POWER_HINT_INTERACTION %d", var);
		set_cpuboost(); */
        break;
    case POWER_HINT_CPU_BOOST:
		// ALOGI("POWER_HINT_CPU_BOOST");
		// ALOGI("POWER_HINT_CPU_BOOST DATA : %d",*(int32_t *)data);
		if (!low_power){
			set_cpuboost();
			}
		break;
    case POWER_HINT_LAUNCH_BOOST:
		/*
		packageName = ((launch_boost_info_t *)data)->packageName;
		pid = ((launch_boost_info_t *)data)->pid;
		ALOGI("POWER_HINT_LAUNCH_BOOST app=%s pid=%d", packageName,pid);
		if (!low_power){
			TODO! Set process priority when pid >0
		} */
		break;
    case POWER_HINT_SET_PROFILE:
        if(data != NULL){
			var = *(int *) data;
		}
        set_power_profile(var);
		break;
    case POWER_HINT_VIDEO_ENCODE:
		break;
    case POWER_HINT_VIDEO_DECODE:
		break;
    default:
		ALOGI("unknown POWER_HINT: %d",hint);
        break;
    }
}

void set_feature(struct power_module *module, feature_t feature, int state)
{
	
#ifdef TAP_TO_WAKE_NODE
    char tmp_str[64];
    if (feature == POWER_FEATURE_DOUBLE_TAP_TO_WAKE) {
        snprintf(tmp_str, 64, "%d", state);
        power_fwrite(TAP_TO_WAKE_NODE, tmp_str);
        return;
    }
#endif
}

static struct hw_module_methods_t power_module_methods = {
    .open = NULL,
};


static int get_feature(__attribute__((unused)) struct power_module *module,
                       feature_t feature)
{
    if (feature == POWER_FEATURE_SUPPORTED_PROFILES) {
        return PROFILE_MAX;
    }
    return -1;
}


struct power_module HAL_MODULE_INFO_SYM = {
    .common = {
        .tag = HARDWARE_MODULE_TAG,
        .module_api_version = POWER_MODULE_API_VERSION_0_2,
        .hal_api_version = HARDWARE_HAL_API_VERSION,
        .id = POWER_HARDWARE_MODULE_ID,
        .name = "MTK Power HAL",
        .author = "Cyanogen",
        .methods = &power_module_methods,
    },

    .init = power_init,
    .setInteractive = power_set_interactive,
    .powerHint = power_hint,
    .setFeature = set_feature,
    .getFeature = get_feature
};
