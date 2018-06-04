LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
#LOCAL_AAPT_FLAGS 		:= --auto-add-overlay
LOCAL_MODULE            := audio_effects.conf
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := audio_effects.conf
LOCAL_MODULE_PATH       := $(TARGET_OUT)/etc/
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := libv4a_fx_ics.so
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := LIB
LOCAL_SRC_FILES         := libv4a_fx_ics.so
LOCAL_MODULE_PATH       := $(TARGET_OUT)/lib/soundfx
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := com.audlabs.viperfx.settings.xml
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := com.audlabs.viperfx.settings.xml
LOCAL_MODULE_PATH       := $(TARGET_OUT)/etc/pre-defaults/data/data/com.audlabs.viperfx/shared_prefs/
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := com.audlabs.viperfx.speaker.xml
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := com.audlabs.viperfx.speaker.xml
LOCAL_MODULE_PATH       := $(TARGET_OUT)/etc/pre-defaults/data/data/com.audlabs.viperfx/shared_prefs/
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := com.audlabs.viperfx.bluetooth.xml
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := com.audlabs.viperfx.bluetooth.xml
LOCAL_MODULE_PATH       := $(TARGET_OUT)/etc/pre-defaults/data/data/com.audlabs.viperfx/shared_prefs/
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := com.audlabs.viperfx.headset.xml
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := com.audlabs.viperfx.headset.xml
LOCAL_MODULE_PATH       := $(TARGET_OUT)/etc/pre-defaults/data/data/com.audlabs.viperfx/shared_prefs/
include $(BUILD_PREBUILT)


include $(CLEAR_VARS)
LOCAL_MODULE            := ViPERDDC.db
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := files/ViPERDDC.db
LOCAL_MODULE_PATH       := $(TARGET_OUT)/etc/pre-defaults/data/data/com.audlabs.viperfx/files/
include $(BUILD_PREBUILT)



# disable AudioFX Speaker settings
include $(CLEAR_VARS)
LOCAL_MODULE            := speaker.xml
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := DATA
LOCAL_SRC_FILES         := speaker.xml
LOCAL_MODULE_PATH       := $(TARGET_OUT)/etc/pre-defaults/data/data/org.cyanogenmod.audiofx/shared_prefs/
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := libv4a_fx_ics.so
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := ETC
LOCAL_SRC_FILES         := libv4a_fx_ics.so
LOCAL_MODULE_PATH       := $(TARGET_OUT)/etc/pre-defaults/data/data/com.audlabs.viperfx/files/
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_AAPT_FLAGS := --auto-add-overlay
LOCAL_IS_HOST_MODULE =
LOCAL_MODULE = ViperSound
LOCAL_REQUIRED_MODULES := \
	com.audlabs.viperfx.speaker.xml \
	com.audlabs.viperfx.settings.xml \
	com.audlabs.viperfx.bluetooth.xml \
	com.audlabs.viperfx.headset.xml \
	libv4a_fx_ics.so \
	audio_effects.conf \
	ViPERDDC.db \
#	speaker.xml \
#	ViPERDDC.db \

LOCAL_OVERRIDES_PACKAGES := AudioFX
LOCAL_MODULE_CLASS = APPS
LOCAL_MODULE_PATH =
LOCAL_MODULE_RELATIVE_PATH =
LOCAL_MODULE_SUFFIX = .apk
LOCAL_CERTIFICATE = platform
LOCAL_PRIVILEGED_MODULE := true
LOCAL_SRC_FILES = ViPER4Android.apk
include $(BUILD_PREBUILT)

ifeq ($(USE_VIPER_PROFILES),true)
$(shell mkdir -p $(TARGET_OUT)/etc/pre-defaults/storage)
$(shell cp -rf $(LOCAL_PATH)/storage/* $(TARGET_OUT)/etc/pre-defaults/storage/)
endif
