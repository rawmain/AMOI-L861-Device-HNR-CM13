# mt6795 platform boardconfig

#TARGET_TOOLS_PREFIX=/usr/src/android/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-



LOCAL_PATH := device/openstone/stonexone
-include vendor/openstone/stonexone/BoardConfigVendor.mk
-include vendor/openstone/stonexone/vendor_bootjars.mk

# Display
TARGET_FORCE_HWC_FOR_VIRTUAL_DISPLAYS := true
TARGET_RUNNING_WITHOUT_SYNC_FRAMEWORK := true
TARGET_TAP_TO_WAKE_NODE := /proc/gt9xx_gesture


#VSYNC_EVENT_PHASE_OFFSET_NS := 7500000
#SF_VSYNC_EVENT_PHASE_OFFSET_NS := 5000000
#PRESENT_TIME_OFFSET_FROM_VSYNC_NS := 5000000
TARGET_USES_ION := true

#SKIP_BOOT_JARS_CHECK := true

SUPERUSER_PACKAGE := com.openstone.superuser

USE_VIPER_PROFILES := true

TARGET_SPECIFIC_HEADER_PATH := $(LOCAL_PATH)/include
#TARGET_NEEDS_BOOSTED_SOUNDS := true


# MTK Setup
MTK_PROJECT_PATH := $(TOP)/$(LOCAL_PATH)
MTK_ROOT := vendor/mediatek/proprietary
MTK_PATH_SOURCE := vendor/mediatek/proprietary
MTK_PATH_CUSTOM := vendor/mediatek/proprietary/custom/common
COMMON_GLOBAL_CPPFLAGS += -DMTK_AUDIO
COMMON_GLOBAL_CFLAGS += -DMTK_AUDIO
# MTK audio
MTK_AUDIO_BLOUD_CUSTOMPARAMETER_REV := MTK_AUDIO_BLOUD_CUSTOMPARAMETER_V5
MTK_WEEK_NO := W10.24
MTK_INTERNAL := yes
MTK_PLATFORM := mt6795
MTK_AUDIO_HD_REC_SUPPORT := yes
MTK_AUDIO_BLOUD_CUSTOMPARAMETER_V5 := yes
#
MTK_SPEAKER_MONITOR_SUPPORT := no
MTK_HIGH_RESOLUTION_AUDIO_SUPPORT := yes
MTK_SUPPORT_TC1_TUNNING := yes
MTK_LOSSLESS_BT_SUPPORT := yes
MTK_ENABLE_MD1 := yes
MTK_BT_SUPPORT := yes
HAVE_SRSAUDIOEFFECT_FEATURE := yes
MTK_VOIP_ENHANCEMENT_SUPPORT := yes
MTK_HANDSFREE_DMNR_SUPPORT := yes
HAVE_MATV_FEATURE := yes
MTK_USE_ANDROID_MM_DEFAULT_CODE := yes
MTK_BASIC_PACKAGE := yes
COMMON_GLOBAL_CPPFLAGS += -DMTK_BASIC_PACKAGE
#
HAVE_AEE_FEATURE := yes
# hevc

# COMMON_GLOBAL_CPPFLAGS += MTK_USEDPFRMWK
# +++USE_LIBYUV

#
#MTK FM
# USE_CUSTOM_AUDIO_POLICY := 0
# USE_LEGACY_AUDIO_POLICY := 1
# USE_CONFIGURABLE_AUDIO_POLICY := 1
# FAKE_FM := 1
# thermal
# MTK_C2K_SUPPORT := yes
# MTK_THERMAL_PA_VIA_ATCMD := yes
# COMMON_GLOBAL_CFLAGS += -DTHERMAL_MD_TP=1

#TARGET_TOOLS_PREFIX=/usr/src/android/ubertc/bin/aarch64-linux-android-
#TARGET_TOOLS_PREFIX=/usr/src/android/gcc-linaro-4.9.4-2017.01-x86_64_aarch64-linux-gnu/bin/aarch64-linux-gnu-
#USE_CAMERA_STUB := true
# USE_MTK_CAMERA_WRAPPER := true
# USE_MTK_CAMERA_WRAPPER := true
CAMERA_HARDWARE_MODULE_ID := camera
MTK_MMPROFILE_SUPPORT := yes
#TARGET_SPECIFIC_CAMERA_PARAMETER_LIBRARY := libcamera_client_mtk
#MTK_CAMERAMMP_SUPPORT := yes

MTK_FIX_OMADRM := 1
BOARD_CANT_REALLOCATE_OMX_BUFFERS := true

COMMON_GLOBAL_CPPFLAGS += \
	-DMTK_FIX_OMADRM=1 \
	-DBOARD_CANT_REALLOCATE_OMX_BUFFERS


MTK_MIRAVISION_SUPPORT := yes

COMMON_GLOBAL_CPPFLAGS += \
	-DMTK_MMPROFILE_SUPPORT=1 \



#MTK_PATH_SOURCE := $(LOCAL_PATH)/mediatek
#MTK_MTKCAM_PLATFORM := mediatek/hardware/mtkcam/legacy/platform/mt6795
#MTKCAM_C_INCLUDES := $(LOCAL_PATH)/mediatek/hardware/mtkcam/legacy/platform/mt6795/include

TARGET_PROVIDES_INIT_RC := true
TARGET_ENABLE_NON_PIE_SUPPORT := true
MTK_ENGINEERMODE_APP := yes

#SUPERUSER_EMBEDDED := true
BOARD_NUMBER_OF_CAMERAS := 2
MAX_CAMERAS := 2


TARGET_HAS_LEGACY_CAMERA_HAL1 := true
#USE_LEGACY_MTK_AV_BLOB := true
USE_SENSOR_MULTI_HAL := true

# BOARD_USES_LEGACY_MTK_AV_BLOB := true

# MTK_WEEK_NO := 10
# later
# BT_DB_AUTO_GEN_SCRIPTS_PATH
#
LCM_WIDTH := 1440
LCM_HEIGHT := 2560
MTK_WVDRM_SUPPORT := yes
#
# Platform
ARCH_ARM_HAVE_TLS_REGISTER := true
TARGET_BOARD_PLATFORM := mt6795
TARGET_NO_BOOTLOADER := true
TARGET_NO_FACTORYIMAGE := true
TARGET_BUILD_JAVA_SUPPORT_LEVEL := platform
TARGET_LDPRELOAD := libxlog.so:libmtk_symbols.so

# mixed MTK
#MTK_VIDEO_HEVC_SUPPORT := yes
#MTK_LIVE_PHOTO_SUPPORT := yes
#MTK_BT_FM_OVER_BT_VIA_CONTROLLER := yes
# MTK_CAM_MMSDK_SUPPORT := yes
MTK_BESLOUDNESS_SUPPORT := yes
MTK_AUDENH_SUPPORT := yes
BOARD_USES_MTK_BESLOUDNESS_SUPPORT := yes
BOARD_USES_MTK_AUDENH_SUPPORT := yes


COMMON_GLOBAL_CPPFLAGS += \
	-DMTK_AUDENH_SUPPORT=1 \
	-DMTK_BESLOUDNESS_SUPPORT=1 \


# SDCARD	
MTK_SHARED_SDCARD := 1

COMMON_GLOBAL_CPPFLAGS += \
	-DMTK_SHARED_SDCARD=1 \
	
# NFC

MTK_NFC_SUPPORT := yes

#FM

BOARD_HAVE_ALTERNATE_FM := true
MTK_FM_SUPPORT := yes
MTK_FM_RX_SUPPORT :=yes
MTK_FM_CHIP := MT6630_FM
MTK_FM_RX_AUDIO := FM_DIGITAL_INPUT
MTK_FM_TX_AUDIO := FM_DIGITAL_OUTPUT
MTK_FM_TX_SUPPORT := no
FM_RAIDO_BAND := 1
MTK_FMRADIO_APP := yes
MTK_FM_50KHZ_SUPPORT := no
MTK_FM_RECORDING_SUPPORT := yes
MTK_FM_SHORT_ANTENNA_SUPPORT := yes




# MTK
#MTK_CHIP_VER := S01
#MTK_BT_21_SUPPORT := yes
#MTK_BT_30_HS_SUPPORT := yes
#MTK_BT_30_SUPPORT := yes
#MTK_BT_40_LE_STANDALONE := no
#MTK_BT_40_SUPPORT := yes
#MTK_BT_A2DP_APTX_SUPPORT := yes
#MTK_BT_BLE_MANAGER_SUPPORT := yes
#MTK_BT_CHIP := MTK_MT6630
#MTK_BT_FM_OVER_BT_VIA_CONTROLLER := yes
#MTK_BT_POWER_EFFICIENCY_ENHANCEMENT := yes
#MTK_BT_SUPPORT := yes
#NO_INIT_PERMISSION_CHECK := yes


# CPU
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := generic
TARGET_CPU_SMP := true

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv7-a-neon
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a53
TARGET_BOARD_SUFFIX := _64
TARGET_USES_64_BIT_BINDER := true

TARGET_CPU_CORTEX_A53 := true

TARGET_BOOTLOADER_BOARD_NAME := mt6795

# FIX Freezing
TARGET_NO_SENSOR_PERMISSION_CHECK := true
TARGET_REQUIRES_SYNCHRONOUS_SETSURFACE := true



# MTK Hardware
BOARD_HAS_MTK_HARDWARE := true
MTK_HARDWARE := true


TARGET_KMODULES := true
BOARD_GLOBAL_CFLAGS += -DCOMPAT_SENSORS_M
BOARD_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
BOARD_GLOBAL_CFLAGS += -DCAMERA_VENDOR_L_COMPAT
BOARD_DISABLE_HW_ID_MATCH_CHECK := true;
COMMON_GLOBAL_CFLAGS += -DMTK_HARDWARE -DADD_LEGACY_ACQUIRE_BUFFER_SYMBOL -DDISABLE_ASHMEM_TRACKING
COMMON_GLOBAL_CPPFLAGS += -DMTK_HARDWARE

# Audio
BOARD_USES_MTK_AUDIO := true
BOARD_CONNECTIVITY_VENDOR := MediaTek
USE_XML_AUDIO_POLICY_CONF := 0
BOARD_USES_ALSA_AUDIO := true
#BOARD_USES_LEGACY_ALSA := true
BUILD_WITH_ALSA_UTILS := true
#BOARD_USES_GENERIC_AUDIO := false
#USE_CUSTOM_AUDIO_POLICY := 1
#AUDIO_FEATURE_ENABLED_RECORD_PLAY_CONCURRENCY := true
#AUDIO_FEATURE_ENABLED_FM_POWER_OPT := true
#AUDIO_FEATURE_ENABLED_EXTN_FORMATS := true
#AUDIO_FEATURE_ENABLED_COMPRESS_VOIP := true

# Kernel
TARGET_USES_64_BIT_BINDER := true
TARGET_IS_64_BIT := true
BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2 androidboot.selinux=permissive
# androidboot.verifiedbootstate=green
BOARD_KERNEL_BASE := 0x40078000
BOARD_KERNEL_PAGESIZE := 2048
BOARD_MKBOOTIMG_ARGS := --base 0x40078000 --pagesize 2048 --kernel_offset 0x00008000 --ramdisk_offset 0x03f88000 --second_offset 0x00f00000 --tags_offset 0x0df88000 --board 1453346013
TARGET_PREBUILT_KERNEL := $(LOCAL_PATH)/prebuilt/kernel

TARGET_KMODULES := true

# Hack for building without kernel sources
$(shell mkdir -p $(OUT)/obj/KERNEL_OBJ/usr)
# remove this when 6.0 Kernel is available
# POLICYVERS := 29

# Display
USE_OPENGL_RENDERER := true
BOARD_EGL_CFG := $(LOCAL_PATH)/configs/egl.cfg
#BOARD_NO_SUPPORT_SWAP_BUFFERS_WITH_DAMAGE := true
#BOARD_DONT_USE_NATIVE_FENCE_SYNC := true
TARGET_SCREEN_HEIGHT := 2560
TARGET_SCREEN_WIDTH := 1440
BOARD_EGL_WORKAROUND_BUG_10194508 := true



# Flags
TARGET_GLOBAL_CFLAGS   += -mfpu=neon -mfloat-abi=softfp 

#-Werror=unused-function
#-Wno-error
TARGET_GLOBAL_CPPFLAGS += -mfpu=neon -mfloat-abi=softfp 
#-Werror=unused-function
# -Wno-error
COMMON_GLOBAL_CFLAGS += -DNO_SECURE_DISCARD
COMMON_GLOBAL_CFLAGS += -DDISABLE_HW_ID_MATCH_CHECK

# LightHAL
TARGET_PROVIDES_LIBLIGHT := true

# Enable Minikin text layout engine (will be the default soon)
USE_MINIKIN := true


# Offline charging
# WITH_CM_CHARGER := false
BOARD_CHARGING_MODE_BOOTING_LPM := /sys/class/BOOT/BOOT/boot/boot_mode
BOARD_CHARGER_ENABLE_SUSPEND := true
BOARD_CHARGER_SHOW_PERCENTAGE := true
#BOARD_HAL_STATIC_LIBRARIES := libhealthd.mtk
BOARD_CHARGER_DISABLE_INIT_BLANK := true


# Fonts
EXTENDED_FONT_FOOTPRINT := true

TARGET_SYSTEM_PROP := $(LOCAL_PATH)/system.prop

# Bluetooth
BARD_HAVE_BLUETOOTH := true
BOARD_HAVE_BLUETOOTH_MTK := true
BOARD_BLUETOOTH_DOES_NOT_USE_RFKILL := true
BOARD_BLUETOOTH_BDROID_BUILDCFG_INCLUDE_DIR := $(LOCAL_PATH)/bluetooth

#AUDIO_FEATURE_ENABLED_SPLIT_A2DP := true
#BOARD_BLUETOOTH_BDROID_HCILP_INCLUDED :=true

# GPS
MTK_K64_SUPPORT := yes
MTK_OPEN_PACKAGE := yes
COMMON_GLOBAL_CPPFLAGS += -DMTK_K64_SUPPORT -DMTK_OPEN_PACKAGE
COMMON_GLOBAL_CFLAGS += -DMTK_K64_SUPPORT -DMTK_OPEN_PACKAGE
BOARD_GPS_LIBRARIES := true
BOARD_MEDIATEK_USES_GPS := true

# MTK_WLAN_SUPPORT
BOARD_WLAN_DEVICE := MediaTek
WPA_SUPPLICANT_VERSION := VER_0_8_X
BOARD_HOSTAPD_DRIVER := NL80211
BOARD_HOSTAPD_PRIVATE_LIB := lib_driver_cmd_mt66xx
BOARD_WPA_SUPPLICANT_DRIVER := NL80211
BOARD_WPA_SUPPLICANT_PRIVATE_LIB := lib_driver_cmd_mt66xx
WIFI_DRIVER_FW_PATH_PARAM := "/dev/wmtWifi"
WIFI_DRIVER_FW_PATH_STA := STA
WIFI_DRIVER_FW_PATH_AP := AP
WIFI_DRIVER_FW_PATH_P2P := P2P

# build old-style zip files (required for ota updater)
BLOCK_BASED_OTA := false

# make_ext4fs requires numbers in dec format
TARGET_USERIMAGES_USE_EXT4 := true
BOARD_HAS_LARGE_FILESYSTEM := true
# BOARD_BOOTIMAGE_PARTITION_SIZE := 20971520
BOARD_BOOTIMAGE_PARTITION_SIZE := 16777216
# BOARD_RECOVERYIMAGE_PARTITION_SIZE := 20971520
BOARD_RECOVERYIMAGE_PARTITION_SIZE := 16777216
# BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1610612736
BOARD_SYSTEMIMAGE_PARTITION_SIZE := 1887436800
#BOARD_USERDATAIMAGE_PARTITION_SIZE := 13474725888
BOARD_USERDATAIMAGE_PARTITION_SIZE := 28415885312
#BOARD_CACHEIMAGE_PARTITION_SIZE := 402653184
BOARD_CACHEIMAGE_PARTITION_SIZE := 838860800
BOARD_CACHEIMAGE_FILE_SYSTEM_TYPE := ext4
BOARD_FLASH_BLOCK_SIZE := 131072



TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/class/android_usb/android0/f_mass_storage/lun/file

# Recovery
RECOVERY_VARIANT := twrp
#RECOVERY_VARIANT := cwm


# TWRP stuff
ifeq ($(RECOVERY_VARIANT), twrp)
TW_EXCLUDE_SUPERSU := true
TW_OEM_BUILD := false
TWRP_INCLUDE_LOGCAT := true
TWHAVE_SELINUX := false
#TW_USE_TOOLBOX := false
TARGET_PREBUILT_RECOVERY_KERNEL := $(LOCAL_PATH)/prebuilt/kernel
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
DEVICE_RESOLUTION := 2560x1440
DEVICE_SCREEN_WIDTH := 2560
DEVICE_SCREEN_HEIGHT := 1440
TARGET_USE_CUSTOM_LUN_FILE_PATH := /sys/devices/platform/mt_usb/musb-hdrc.0.auto/gadget/lun%d/file
TARGET_RECOVERY_LCD_BACKLIGHT_PATH := \"/sys/class/leds/lcd-backlight/brightness\"
BOARD_HAS_NO_SELECT_BUTTON := true
TW_NO_REBOOT_BOOTLOADER := true
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/recovery.fstab
#TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/recovery/etc/twrp.fstab
TW_THEME := portrait_hdpi
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_CUSTOM_CPU_TEMP_PATH := /sys/devices/virtual/thermal/thermal_zone1/temp
TW_CUSTOM_BATTERY_PATH := /sys/class/power_supply/battery
TW_USE_MODEL_HARDWARE_ID_FOR_DEVICE_ID := true
RECOVERY_GRAPHICS_USE_LINELENGTH := true
RECOVERY_SDCARD_ON_DATA := true
TW_INTERNAL_STORAGE_PATH := "/data/media/0"
TW_INTERNAL_STORAGE_MOUNT_POINT := "data"
TW_EXTERNAL_STORAGE_PATH := "/external_sd"
TW_EXTERNAL_STORAGE_MOUNT_POINT := "external_sd"
TW_DEFAULT_EXTERNAL_STORAGE := true
TW_MAX_BRIGHTNESS := 255
BOARD_SUPPRESS_SECURE_ERASE := true
TW_INCLUDE_CRYPTO := true
TW_CRYPTO_FS_TYPE := "ext4"
TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/mtk-msdc.0/11230000.MSDC0/by-name/userdata" # i think this isn't used anymore
#TW_CRYPTO_REAL_BLKDEV := "/dev/block/platform/mtk-msdc.0/by-name/userdata"
TW_CRYPTO_MNT_POINT := "/data"
TW_CRYPTO_FS_OPTIONS := "nosuid,nodev,noatime,discard,noauto_da_alloc,data =ordered"
TW_BRIGHTNESS_PATH := /sys/class/leds/lcd-backlight/brightness
TW_MAX_BRIGHTNESS := 255
TW_DEFAULT_BRIGHTNESS := 152
#TW_SCREEN_TIMEOUT_SECS := 240
TW_NO_SCREEN_TIMEOUT := 1
TW_NO_USB_STORAGE := true
BOARD_USE_FRAMEBUFFER_ALPHA_CHANNEL := true
TARGET_DISABLE_TRIPLE_BUFFERING := false
else
# CWM
BOARD_HAS_NO_SELECT_BUTTON := true
BOARD_RECOVERY_SWIPE := true
BOARD_SUPPRESS_EMMC_WIPE := true
BOARD_USE_CUSTOM_RECOVERY_FONT := \"roboto_15x24.h\"
TARGET_RECOVERY_FSTAB := $(LOCAL_PATH)/rootdir/recovery.fstab
TARGET_RECOVERY_PIXEL_FORMAT := "RGBA_8888"
TARGET_USERIMAGES_USE_EXT4 := true
endif

TARGET_USES_LOGD := false

# SELinux
BOARD_SEPOLICY_DIRS := \
       device/openstone/stonexone/sepolicy

POLICYVERS := 30

# Google properties overides
PRODUCT_PROPERTY_OVERRIDES += \
keyguard.no_require_sim=true \
ro.url.legal=http://www.google.com/intl/%s/mobile/android/basic/phone-legal.html \
ro.url.legal.android_privacy=http://www.google.com/intl/%s/mobile/android/basic/privacy.html \
ro.com.google.clientidbase=android-google \
ro.com.android.wifi-watchlist=GoogleGuest \
ro.error.receiver.system.apps=com.google.android.gms \
ro.setupwizard.enterprise_mode=1 \
ro.com.android.dataroaming=false \
net.tethering.noprovisioning=true \
ro.setupwizard.rotation_locked=true





# RIL
BOARD_RIL_CLASS := ../../../device/openstone/stonexone/ril
BOARD_CONNECTIVITY_VENDOR := MediaTek
BOARD_CONNECTIVITY_MODULE := conn_soc

MTK_CIP_SUPPORT := yes
MTK_DT_SUPPORT := no
MTK_VT3G324M_SUPPORT := no
MTK_UMTS_TDD128_MODE := no
MTK_SHARE_MODEM_CURRENT := 1
MTK_SHARE_MODEM_SUPPORT := 2
MTK_MD_SHUT_DOWN_NT := yes
MTK_FD_SUPPORT := yes
MTK_IPV6_SUPPORT := yes
MTK_LTE_SUPPORT := yes
MTK_LTE_DC_SUPPORT := no
MTK_SVLTE_SUPPORT := no
MTK_EAP_SIM_AKA := yes
MTK_IRAT_SUPPORT := no
MTK_DTAG_DUAL_APN_SUPPORT := no
MTK_MD1_SUPPORT := 5
MTK_MD2_SUPPORT := 4
MTK_MD3_SUPPORT := 2
MTK_MD5_SUPPORT := 5
MTK_ENABLE_MD1 = yes
MTK_ENABLE_MD2 = no
MTK_ENABLE_MD3 = no
MTK_ENABLE_MD5 = no
MTK_TC1_FEATURE := no
MTK_SIM_RECOVERY := yes
MTK_SIM_HOT_SWAP_COMMON_SLOT := no
MTK_WORLD_PHONE := yes
MTK_VOLTE_SUPPORT := yes
MTK_VILTE_SUPPORT := yes
MTK_WIFI_CALLING_RIL_SUPPORT := yes
COMMON_GLOBAL_CFLAGS += \
	-DMTK_CIP_SUPPORT=1 \
	-DMTK_SHARE_MODEM_CURRENT=1 \
	-DMTK_SHARE_MODEM_SUPPORT=2 \
	-DMTK_MD_SHUTDOWN_NT=1 \
	-DMTK_FD_SUPPORT=1 \
	-DMTK_IPV6_SUPPORT=1 \
	-DMTK_LTE_SUPPORT=1 \
	-DMTK_EAP_SIM_AKA=1 \
	-DMTK_MD1_SUPPORT=5 \
	-DMTK_MD2_SUPPORT=4 \
	-DMTK_MD3_SUPPORT=2 \
	-DMTK_MD5_SUPPORT=5 \
	-DMTK_ENABLE_MD1=1 \
	-DMTK_SIM_RECOVERY=1 \
	-DMTK_WORLD_PHONE=1 \
	-DMTK_VOLTE_SUPPORT=1 \
	-DMTK_VILTE_SUPPORT=1 \
	-DMTK_WIFI_CALLING_RIL_SUPPORT=1 \

COMMON_GLOBAL_CPPFLAGS += \
	-DMTK_CIP_SUPPORT=1 \
	-DMTK_SHARE_MODEM_CURRENT=1 \
	-DMTK_SHARE_MODEM_SUPPORT=2 \
	-DMTK_MD_SHUTDOWN_NT=1 \
	-DMTK_FD_SUPPORT=1 \
	-DMTK_IPV6_SUPPORT=1 \
	-DMTK_LTE_SUPPORT=1 \
	-DMTK_EAP_SIM_AKA=1 \
	-DMTK_MD1_SUPPORT=5 \
	-DMTK_MD2_SUPPORT=4 \
	-DMTK_MD3_SUPPORT=2 \
	-DMTK_MD5_SUPPORT=5 \
	-DMTK_ENABLE_MD1=1 \
	-DMTK_SIM_RECOVERY=1 \
	-DMTK_WORLD_PHONE=1 \
	-DMTK_VOLTE_SUPPORT=1 \
	-DMTK_VILTE_SUPPORT=1 \
	-DMTK_WIFI_CALLING_RIL_SUPPORT=1 \
