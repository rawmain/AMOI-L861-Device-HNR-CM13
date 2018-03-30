$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)
$(call inherit-product, device/openstone/stonexone/vendor/copyfiles.mk)
$(call inherit-product, vendor/openstone/stonexone/stonexone-vendor-blobs.mk)

LOCAL_PATH := device/openstone/stonexone

DEVICE_PACKAGE_OVERLAYS += $(LOCAL_PATH)/overlay

# Device uses high-density artwork where available
PRODUCT_AAPT_CONFIG := normal xhdpi xxhdpi xxxhdpi
PRODUCT_AAPT_PREF_CONFIG := xxxhdpi

# Recovery allowed devices
TARGET_OTA_ASSERT_DEVICE := stonexone,Vowney_Lite,KING7,king7,L861,STONEX,STONEXONE,AMOI


PRODUCT_PACKAGES += \
   WeatherListWidget \
   WeatherProvider \
   WeatherManagerService

PRODUCT_PACKAGES += \
   libxlog \
   libstlport \
#   ambientsdk \

# TWRP

# Hack to fix asec on emulated sdcard
PRODUCT_PACKAGES += \
    asec_helper

# Superuser
PRODUCT_PACKAGES += \
	Superuser \
    su

PRODUCT_PACKAGES += \
    sensors.mt6795 \

# Camera

PRODUCT_PACKAGES += \
	libcamera_client_mtk \
	com.mediatek.transcode \
	libjtranscode \
	libMtkVideoTranscoder \
	libcamera_parameters_ext \
    Snap

PRODUCT_PROPERTY_OVERRIDES += \
    camera2.portability.force_api=1 \
    media.stagefright.legacyencoder=true \
    media.stagefright.less-secure=true \
	persist.camera.HAL3.enabled=1 \
	persist.camera.eis.enable=1 \
	camera.disable_zsl_mode=1
# Audio

PRODUCT_PACKAGES += \
    audio_policy.default \
    audio.r_submix.default \
    audio.usb.default \
    libtinyalsa \
    libtinycompress \
    libtinymix \
#    libaudiopolicymanager \
#    libaudiopolicymanagerdefault \
#    libaudiopolicyservice \

    

    
#    libtinyxml
# MTK Audio
# PRODUCT_PACKAGES += \
#	libfmjni \
#	libfmmt6620 \
#	libfmmt6627 \
#	libfmmt6628 \
#	libfmmt6630 \
#	libfmcust
#	AudioSetParam \
#	libaudio_param_parser \
#	libaudiocustparam \
#	libaudiosetting \
#	libaudiomtkdcremoval \
#	libaudiocrflt \
#	libspeech_enh_lib \
#	libbessound_hd_mtk \
#	libbessurround_mtk \
#	libaudiocomponentengine \
#    libaudiocompensationfilter \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/audio_device.xml:system/etc/audio_device.xml \
    $(LOCAL_PATH)/configs/audio_policy.conf:system/etc/audio_policy.conf \
    $(LOCAL_PATH)/configs/audio_em.xml:system/etc/audio_em.xml \
    $(LOCAL_PATH)/configs/audio_effects.conf:system/etc/audio_effects.conf \
    $(LOCAL_PATH)/configs/init.d/01audiolevel:system/etc/init.d/01audiolevel \
#    $(LOCAL_PATH)/configs/audio_param/AudioParamOptions.xml:system/etc/audio_param/AudioParamOptions.xml


# Charger

PRODUCT_PACKAGES += \
    charger \
    charger_res_images \


# livedisplay
#PRODUCT_PACKAGES += \
#	liblivedisplay \
#	libjni_livedisplay

# Display
PRODUCT_PACKAGES += \
	libion \
	liblog \
	libion_mtk \
	libmtk_symbols

# Mediatek Framework
PRODUCT_PACKAGES += \
	dumpsys \
	servicemanager \
	sensorservice \
	dumpstate \
	libbinder \
	libui \
	libgui \
	libbatteryservice \
	libsurfaceflinger \
	libgralloc_extra \
    libhardware \
	libcutils \
	libutils \
	libEGL \
	libGLESv1_CM \
	libGLESv2 \
	egl.cfg \
	libETC1 \
	libinput \
	libui_ext \
	libgui_ext \
	ext4_resize \
	libperfservicenative \
	libaed

    
# Bluetooth
PRODUCT_PACKAGES += \
    audio.a2dp.default
PRODUCT_PACKAGES += \
    libbt-vendor
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/bt_did.conf:system/etc/bluetooth/bt_did.conf

# Keyboard layout
PRODUCT_COPY_FILES += \
     $(LOCAL_PATH)/configs/mtk-kpd.kl:system/usr/keylayout/mtk-kpd.kl \
     $(LOCAL_PATH)/configs/ACCDET.kl:system/usr/keylayout/ACCDET.kl \
     $(LOCAL_PATH)/configs/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# Power
PRODUCT_PACKAGES += \
    power.default \
#    power.mt6795

# Ramdisk
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/rootdir/enableswap.sh:root/enableswap.sh \
    $(LOCAL_PATH)/rootdir/factory_init.project.rc:root/factory_init.project.rc \
    $(LOCAL_PATH)/rootdir/factory_init.rc:root/factory_init.rc \
    $(LOCAL_PATH)/rootdir/fstab.charger:root/fstab.charger \
    $(LOCAL_PATH)/rootdir/fstab.mt6795:root/fstab.mt6795 \
    $(LOCAL_PATH)/rootdir/init.aee.rc:root/init.aee.rc \
    $(LOCAL_PATH)/rootdir/init.modem.rc:root/init.modem.rc \
    $(LOCAL_PATH)/rootdir/init.mt6795.rc:root/init.mt6795.rc \
    $(LOCAL_PATH)/rootdir/init.mt6795.usb.rc:root/init.mt6795.usb.rc \
    $(LOCAL_PATH)/rootdir/init.project.rc:root/init.project.rc \
    $(LOCAL_PATH)/rootdir/init.rc:root/init.rc \
    $(LOCAL_PATH)/rootdir/init.ssd.rc:root/init.ssd.rc \
    $(LOCAL_PATH)/rootdir/init.xlog.rc:root/init.xlog.rc \
    $(LOCAL_PATH)/rootdir/meta_init.modem.rc:root/meta_init.modem.rc \
    $(LOCAL_PATH)/rootdir/meta_init.project.rc:root/meta_init.project.rc \
    $(LOCAL_PATH)/rootdir/meta_init.rc:root/meta_init.rc \
    $(LOCAL_PATH)/rootdir/init.performance.rc:root/init.performance.rc \
    $(LOCAL_PATH)/rootdir/ueventd.mt6795.rc:root/ueventd.mt6795.rc \
    $(LOCAL_PATH)/rootdir/init.recovery.mt6795.rc:root/init.recovery.mt6795.rc \
    $(LOCAL_PATH)/rootdir/sbin/umod.sh:root/sbin/umod.sh \

# Telecom
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/apns-conf.xml:system/etc/apns-conf.xml \
    $(LOCAL_PATH)/configs/ecc_list.xml:system/etc/ecc_list.xml \
    $(LOCAL_PATH)/configs/spn-conf.xml:system/etc/spn-conf.xml

# Thermal
PRODUCT_PACKAGES += \
	thermal
	
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/thermal/thermal.conf:system/etc/.tp/thermal.conf \
	$(LOCAL_PATH)/configs/thermal/thermal.off.conf:system/etc/.tp/thermal.off.conf \
	$(LOCAL_PATH)/configs/thermal/.ht120.mtc:system/etc/.tp/.ht120.mtc \
	$(LOCAL_PATH)/configs/thermal/.thermal_policy_00:system/etc/.tp/.thermal_policy_00 \
	$(LOCAL_PATH)/configs/thermal/.thermal_policy_01:system/etc/.tp/.thermal_policy_01 \
	$(LOCAL_PATH)/configs/throttle.sh:system/etc/throttle.sh \
	$(LOCAL_PATH)/configs/thermal/thermal.high.conf:system/etc/.tp/thermal.high.conf \
	$(LOCAL_PATH)/configs/thermal/thermal.low.conf:system/etc/.tp/thermal.low.conf \
	$(LOCAL_PATH)/configs/thermal/thermal.mid.conf:system/etc/.tp/thermal.mid.conf \

# These are the hardware-specific features
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/android.hardware.microphone.xml:system/etc/permissions/android.hardware.microphone.xml \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.autofocus.xml:system/etc/permissions/android.hardware.camera.autofocus.xml \
    $(LOCAL_PATH)/configs/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.sensor.gyroscope.xml:system/etc/permissions/android.hardware.sensor.gyroscope.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepcounter.xml:system/etc/permissions/android.hardware.sensor.stepcounter.xml \
    frameworks/native/data/etc/android.hardware.sensor.stepdetector.xml:system/etc/permissions/android.hardware.sensor.stepdetector.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.xml:system/etc/permissions/android.hardware.touchscreen.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.ethernet.xml:system/etc/permissions/android.hardware.ethernet.xml \
    frameworks/native/data/etc/android.hardware.audio.low_latency.xml:system/etc/permissions/android.hardware.audio.low_latency.xml \
    frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
    frameworks/native/data/etc/android.hardware.bluetooth_le.xml:system/etc/permissions/android.hardware.bluetooth_le.xml \
    frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.usb.host.xml:system/etc/permissions/android.hardware.usb.host.xml \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml

# Media
PRODUCT_COPY_FILES += \
    frameworks/av/media/libstagefright/data/media_codecs_google_audio.xml:system/etc/media_codecs_google_audio.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_telephony.xml:system/etc/media_codecs_google_telephony.xml \
    frameworks/av/media/libstagefright/data/media_codecs_google_video_le.xml:system/etc/media_codecs_google_video_le.xml

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs.xml:system/etc/media_codecs.xml \
    $(LOCAL_PATH)/configs/media_profiles.xml:system/etc/media_profiles.xml \
    $(LOCAL_PATH)/configs/media_codecs_performance.xml:system/etc/media_codecs_performance.xml \
#    $(LOCAL_PATH)/configs/media_codecs_mediatek_audio.xml:system/etc/media_codecs_mediatek_audio.xml\
#    $(LOCAL_PATH)/configs/media_codecs_mediatek_video.xml:system/etc/media_codecs_mediatek_video.xml \

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/media_codecs_ffmpeg.xml:system/etc/media_codecs_ffmpeg.xml \
	$(LOCAL_PATH)/configs/gps.conf:system/etc/gps.conf \
    $(LOCAL_PATH)/configs/clatd.conf:system/etc/clatd.conf \
    $(LOCAL_PATH)/configs/custom.conf:system/etc/custom.conf \
    $(LOCAL_PATH)/configs/mtklog-config.prop:system/etc/mtklog-config.prop \
    $(LOCAL_PATH)/configs/mtk_omx_core.cfg:system/etc/mtk_omx_core.cfg \
    $(LOCAL_PATH)/configs/mtk_clear_motion.cfg:system/etc/mtk_clear_motion.cfg

PRODUCT_TAGS += dalvik.gc.type-precise


# Wifi
PRODUCT_PACKAGES += \
    lib_driver_cmd_mt66xx \
    libwifi-hal-mt66xx \
    wifi_hal \
    libwpa_client \
    hostapd \
    hostapd_cli \
    dhcpcd.conf \
    wpa_supplicant \
    wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/hostapd/hostapd_default.conf:system/etc/hostapd/hostapd_default.conf \
    $(LOCAL_PATH)/configs/hostapd/hostapd.accept:system/etc/hostapd/hostapd.accept \
    $(LOCAL_PATH)/configs/hostapd/hostapd.deny:system/etc/hostapd/hostapd.deny

# Torch
PRODUCT_PACKAGES += \
    Torch

# STk
PRODUCT_PACKAGES += \
    Stk \
    CarrierConfig

# GPS
PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/agps_profiles_conf2.xml:system/etc/agps_profiles_conf2.xml \

PRODUCT_PACKAGES += \
	gps.$(TARGET_BOARD_PLATFORM)
    

PRODUCT_DEFAULT_PROPERTY_OVERRIDES += \
#	ro.adb.secure=0 \
#	persist.service.adb.enable=1 \
#	ro.secure=0 \
#    ro.allow.mock.location=1 \
#    ro.debuggable=1 \
#    ro.zygote=zygote64_32 \
#    camera.disable_zsl_mode=1 \
#    ro.mount.fs=EXT4 \
#    persist.service.acm.enable=0 \
#    ro.boot.selinux=0 \
#    persist.sys.usb.config=mtp,adb

PRODUCT_PROPERTY_OVERRIDES += \
    ro.kernel.android.checkjni=0 \
    ro.telephony.ril.config=fakeiccid  \
    persist.call_recording.enabled=true \
    persist.call_recording.src=1 \
    persist.debug.wfd.enable=1 \
    ro.product.manufacturer=AMOI

PRODUCT_PACKAGES += \
    librs_jni \
    com.android.future.usb.accessory

PRODUCT_PACKAGES += \
    libnl_2 \
    libtinyxml
    
# Browser
PRODUCT_PACKAGES += \
	Eleven

# FMRadio

PRODUCT_PACKAGES += \
	libmtkplayer \
	FMRadio \
	FmRadio \


PRODUCT_PROPERTY_OVERRIDES += \
    ro.mtk_fm_recording_support=1

# NFC
PRODUCT_PACKAGES += \
    com.android.nfc_extras \
    Tag

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/configs/MTKNfclicense.lic:system/etc/MTKNfclicense.lic 



# GPS
PRODUCT_PACKAGES += \
    gps.mt6795 \
    libcurl

# EngineerMode
PRODUCT_PACKAGES += \
    EngineerMode  \
	libm4u \
	libbwc
    
# Messaging
PRODUCT_PACKAGES += \
    messaging

#Telephony 
PRODUCT_PACKAGES += \
	telephony-common
	
# Lights
PRODUCT_PACKAGES += \
    lights.mt6795

PRODUCT_COPY_FILES += \
    $(LOCAL_PATH)/recovery/etc/twrp.fstab:recovery/root/etc/twrp.fstab

# Filesystem management tools
PRODUCT_PACKAGES += \
    e2fsck \
    fibmap.f2fs \
    fsck.f2fs \
    mkfs.f2fs \
    make_ext4fs \
    resize2fs \
    setup_fs 

#other
PRODUCT_PACKAGES += \
	superumount


# OMX
PRODUCT_PACKAGES += \
    libc2dcolorconvert \
    libdashplayer \
    libdivxdrmdecrypt \
    libextmedia_jni \
    libOmxAacEnc \
    libOmxAmrEnc \
    libOmxCore \
    libOmxEvrcEnc \
    libOmxQcelp13Enc \
    libOmxSwVencMpeg4 \
    libOmxSwVencHevc \
    libOmxVdec \
    libOmxVdecHevc \
    libOmxVenc \
    libOmxVidcCommon \
    libstagefrighthw \
    libstagefright_soft_flacdec \
    libstagefright \
    libstagefright_omx

PRODUCT_PACKAGES += \
    ebtables \
    ethertypes
    
PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=8

# Dalvik/HWUI

#$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-dalvik-heap.mk)
#$(call inherit-product-if-exists, frameworks/native/build/phone-xxhdpi-3072-hwui-memory.mk)
