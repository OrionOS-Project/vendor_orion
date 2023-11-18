ifeq ($(ORION_BUILD_TYPE),Official)
PRODUCT_PACKAGES += \
    Updater

ifeq ($(WITH_GMS),false)
PRODUCT_PACKAGES += \
    UpdaterVanillaOverlay
endif
endif

# Cloned app exemption
PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/etc/sysconfig/preinstalled-packages-platform-orion-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-orion-product.xml


# Private keys
ifeq ($(ORION_BUILD_TYPE),Official)
include vendor/orion-priv/keys/keys.mk
else
-include vendor/orion-priv/keys/keys.mk
endif

