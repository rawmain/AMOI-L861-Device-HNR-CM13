/*
 * Copyright (C) 2015 The CyanogenMod Project
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

enum {
    PROFILE_POWER_SAVE = 0,
    PROFILE_BALANCED,
    PROFILE_HIGH_PERFORMANCE,
    PROFILE_BIAS_POWER_SAVE,
    PROFILE_BIAS_PERFORMANCE,
    PROFILE_MAX
};

typedef struct governor_settings {
	char *above_hispeed_delay;
    int is_interactive;
    int boost;
    int boostpulse_duration;
    int go_hispeed_load;
    int go_hispeed_load_off;
    int hispeed_freq;
    int hispeed_freq_off;
    int io_is_busy;
    int min_sample_time;
    int sampling_down_factor;
    char *target_loads;
    char *target_loads_off;
    int scaling_max_freq;
    int scaling_min_freq;
    int scaling_min_freq_off;
    int cpufreq_turbo_mode; /* thermal management */ 
    int gpu_opp_max_freq;
} power_profile;

// cpufreq table
// 1950000 1781000 1625000 1469000 1326000 1183000 806000 403000

/* gpufrq table
[0] freq = 676000, volt = 108125, idx = 0
[1] freq = 546000, volt = 104375, idx = 1
[2] freq = 390000, volt = 100625, idx = 2
[3] freq = 338000, volt = 99375, idx = 3
[4] freq = 253500, volt = 99375, idx = 4

*/

/* /proc/cpufreq/cpufreq_turbo_mode                          
thermal manager mode
[0] = { .temp = 65000, .freq_delta = 10, .volt_delta = 2500 }
[1] = { .temp = 85000, .freq_delta = 5, .volt_delta = 1250 }
[2] = { .temp = 125000, .freq_delta = 0, .volt_delta = 0 }
*/


/* /proc/cpufreq/cpufreq_ptpod_temperature_limit
ptpod_temperature_limit_1 = 110000
ptpod_temperature_limit_2 = 120000 
*/
 
static power_profile profiles[PROFILE_MAX] = {
    [PROFILE_POWER_SAVE] = {
		.above_hispeed_delay = "0",
        .boost = 0,
        .boostpulse_duration = 0,
        .go_hispeed_load = 90,
        .go_hispeed_load_off = 90,
        .hispeed_freq = 806000,
        .hispeed_freq_off = 403000,
        .io_is_busy = 0,
        .min_sample_time = 60000,
        .sampling_down_factor = 100000,
        .target_loads = "95",
        .target_loads_off = "95",
        .scaling_max_freq = 806000,
        .scaling_min_freq = 403000,
        .scaling_min_freq_off = 403000,
        .cpufreq_turbo_mode = 0,
        .gpu_opp_max_freq = 338000,
    },
    [PROFILE_BIAS_POWER_SAVE] = {
		.above_hispeed_delay = "80000",
        .boost = 0,
        .boostpulse_duration = 500000,
        .go_hispeed_load = 90,
        .go_hispeed_load_off = 90,
        .hispeed_freq = 1183000,
        .hispeed_freq_off = 806000,
        .io_is_busy = 1,
        .min_sample_time = 60000,
        .sampling_down_factor = 100000,
        .target_loads = "80",
        .target_loads_off = "80",
        .scaling_max_freq = 1183000,
        .scaling_min_freq = 403000,
        .scaling_min_freq_off = 403000,
        .cpufreq_turbo_mode = 0,
        .gpu_opp_max_freq = 390000,
    },
    [PROFILE_BALANCED] = {
		.above_hispeed_delay = "10000 1183000:30000",
        .boost = 0,
        .boostpulse_duration = 2000000,
        .go_hispeed_load = 70,
        .go_hispeed_load_off = 90,
        .hispeed_freq = 1326000,
        .hispeed_freq_off = 1183000,
        .io_is_busy = 1,
        .min_sample_time = 60000,
        .sampling_down_factor = 100000,
        .target_loads = "80",
        .target_loads_off = "80",
        .scaling_max_freq = 1326000,
        .scaling_min_freq = 403000,
        .scaling_min_freq_off = 403000,
        .cpufreq_turbo_mode = 1,
        .gpu_opp_max_freq = 546000,
    },
    [PROFILE_BIAS_PERFORMANCE] = {
		.above_hispeed_delay = "10000 1326000:30000",
	    .boost = 0,
        .boostpulse_duration = 2000000,
        .go_hispeed_load = 70,
        .go_hispeed_load_off = 90,
        .hispeed_freq = 1625000,
        .hispeed_freq_off = 1326000,
        .io_is_busy = 1,
        .min_sample_time = 60000,
        .sampling_down_factor = 100000,
        .target_loads = "90",
        .target_loads_off = "95",
        .scaling_max_freq = 1625000,
        .scaling_min_freq = 403000,
        .scaling_min_freq_off = 403000,
        .cpufreq_turbo_mode = 1,
        .gpu_opp_max_freq = 676000,	
	},
    [PROFILE_HIGH_PERFORMANCE] = {
		.above_hispeed_delay = "0",
        .boost = 0,
        /* The CPU is already boosted, set duration to zero
         * to avoid unneccessary writes to boostpulse */
        .boostpulse_duration = 2000000,
        .go_hispeed_load = 50,
        .go_hispeed_load_off = 50,
        .hispeed_freq = 1950000,
        .hispeed_freq_off = 1950000,
        .io_is_busy = 1,
        .min_sample_time = 60000,
        .sampling_down_factor = 100000,
        .target_loads = "80",
        .target_loads_off = "80",
        .scaling_max_freq = 1950000,
        .scaling_min_freq = 403000,
        .scaling_min_freq_off = 403000,
        .cpufreq_turbo_mode = 2,
        .gpu_opp_max_freq = 676000,
    },
};
