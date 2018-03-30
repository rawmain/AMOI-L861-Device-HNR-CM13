#!/bin/bash
cd frameworks/av
git apply -v ../../device/xiaomi/hennessy/patches/framework_av/0001-libmedia-stub-out-MTK-specific-bits-audio-working.patch
git apply -v ../../device/xiaomi/hennessy/patches/framework_av/0002-camera.patch
git apply -v ../../device/xiaomi/hennessy/patches/framework_av/0003-frameworks_av_fmradio_patch.patch
cd ../..
cd frameworks/base
git apply -v ../../device/xiaomi/hennessy/patches/framework_base/0001-location-support-GNSS-extension-presumably-from-MTK.patch
git apply -v ../../device/xiaomi/hennessy/patches/framework_base/0002-location-add-some-logs-just-to-be-confident.patch
git apply -v ../../device/xiaomi/hennessy/patches/framework_base/0003-location-style-fix.patch
git apply -v ../../device/xiaomi/hennessy/patches/framework_base/0004_minimal_xlog_frameworks_base.patch
git apply -v ../../device/xiaomi/hennessy/patches/framework_base/0007-Update-for-mtk.patch
cd ../..
cd frameworks/opt/telephony
git apply -v ../../../device/xiaomi/hennessy/patches/framework_opt_telephony/0001-Update-for-mtk.patch
cd ../../..
cd packages/services/Telephony
git apply -v ../../../device/xiaomi/hennessy/patches/packages_services_Telpheony/0001-Update-for-mtk.patch
cd ../../..
cd system/core
git apply -v ../../device/xiaomi/hennessy/patches/system_core/0001-fix-boot-for-mtk.patch
cd ../..
cd system/netd
git apply -v ../../device/xiaomi/hennessy/patches/system_netd/0001-hotpost-fix.patch
cd ../..
cd hardware/libhardware
git apply -v ../../device/xiaomi/hennessy/patches/hardware_libhardware/0001-fix-gps-light-audio.patch
cd ../..
cd hardware/libhardware_legacy
git apply -v ../../device/xiaomi/hennessy/patches/hardware_libhardware_legacy/0001-patch-for-mtk.patch

cd ../..
cd packages/apps/Settings
git apply -v ../../../device/xiaomi/hennessy/patches/packages_apps_Settings/0001-multisim.patch
cd ../../..
echo Patches Applied Successfully!

