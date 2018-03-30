$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from the common Open Source product configuration
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit from hardware-specific part of the product configuration
$(call inherit-product, device/openstone/stonexone/device.mk)

# Release name
PRODUCT_RELEASE_NAME := stonexone

EXTENDED_FONT_FOOTPRINT := true

PRODUCT_DEVICE := stonexone
PRODUCT_NAME := full_stonexone
PRODUCT_BRAND := OpenStone
PRODUCT_MODEL := Stonex One
PRODUCT_MANUFACTURER := OpenStone
PRODUCT_RESTRICT_VENDOR_FILES := false

# Boot animation
TARGET_SCREEN_HEIGHT      := 2560
TARGET_SCREEN_WIDTH       := 1440
TARGET_BOOTANIMATION_NAME := 1440

PRODUCT_DEFAULT_LANGUAGE := de
PRODUCT_DEFAULT_REGION   := DE
