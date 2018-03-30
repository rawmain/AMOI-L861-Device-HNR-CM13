$(call inherit-product, device/openstone/stonexone/device_stonexone.mk)

$(call inherit-product, device/openstone/stonexone/BoardConfig.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Configure dalvik heap
$(call inherit-product, frameworks/native/build/phone-xxxhdpi-3072-dalvik-heap.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := stonexone
PRODUCT_NAME := cm_stonexone
PRODUCT_BRAND := OpenStone
PRODUCT_MODEL := Stonex One
PRODUCT_MANUFACTURER := OpenStone
