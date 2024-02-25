# Inherit mini common Lineage stuff
$(call inherit-product, vendor/orion/config/common_mini.mk)

# Required packages
PRODUCT_PACKAGES += \
    LatinIME

$(call inherit-product, vendor/orion/config/telephony.mk)
