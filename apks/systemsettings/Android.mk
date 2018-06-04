LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE            := com.android.settings_preferences.xml
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := DATA
LOCAL_SRC_FILES         := com.android.settings_preferences.xml
LOCAL_MODULE_PATH       := $(TARGET_OUT)/etc/pre-defaults/data/data/com.android.settings/shared_prefs/
include $(BUILD_PREBUILT)
