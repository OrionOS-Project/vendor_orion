# Inherit common Lineage stuff
$(call inherit-product, vendor/orion/config/common.mk)

# Inherit Lineage atv device tree
$(call inherit-product, device/orion/atv/lineage_atv.mk)

# AOSP packages
PRODUCT_PACKAGES += \
    LeanbackIME

# Lineage packages
PRODUCT_PACKAGES += \
    LineageCustomizer

PRODUCT_PACKAGE_OVERLAYS += vendor/orion/overlay/tv
