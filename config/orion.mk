ifeq ($(ORION_BUILD_TYPE),Official)
PRODUCT_PACKAGES += \
    Updater
endif

# Private keys
ifeq ($(ORION_BUILD_TYPE),Official)
include vendor/orion-priv/keys/keys.mk
else
-include vendor/orion-priv/keys/keys.mk
endif
