LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)
LOCAL_MODULE            := efu
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := DATA
LOCAL_SRC_FILES         := efu.apk
LOCAL_MODULE_SUFFIX 	:= .apk
#LOCAL_CERTIFICATE 		:= platform
#LOCAL_PRIVILEGED_MODULE := true
LOCAL_DEX_PREOPT 		:= false
LOCAL_MODULE_PATH       := $(TARGET_OUT)/../data/app
#LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := lgg4
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := DATA
LOCAL_SRC_FILES         := lgg4.apk
LOCAL_MODULE_SUFFIX 	:= .apk
#LOCAL_CERTIFICATE 		:= platform
#LOCAL_PRIVILEGED_MODULE := true
LOCAL_DEX_PREOPT 		:= false
LOCAL_MODULE_PATH       := $(TARGET_OUT)/../data/app
#LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_PREBUILT)

include $(CLEAR_VARS)
LOCAL_MODULE            := xpz5
LOCAL_MODULE_TAGS       := optional
LOCAL_MODULE_CLASS      := DATA
LOCAL_SRC_FILES         := xpz5.apk
LOCAL_MODULE_SUFFIX 	:= .apk
#LOCAL_CERTIFICATE 		:= platform
#LOCAL_PRIVILEGED_MODULE := true
LOCAL_DEX_PREOPT 		:= false
LOCAL_MODULE_PATH       := $(TARGET_OUT)/../data/app
#LOCAL_PROPRIETARY_MODULE := true
include $(BUILD_PREBUILT)
