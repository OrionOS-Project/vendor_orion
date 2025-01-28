# PIF values
PRODUCT_PRODUCT_PROPERTIES += \
    persist.sys.pihooks_MANUFACTURER?=Google \
    persist.sys.pihooks_BRAND?=google \
    persist.sys.pihooks_PRODUCT?=comet_beta \
    persist.sys.pihooks_DEVICE?=comet \
    persist.sys.pihooks_ID?=BP22.250103.008 \
    persist.sys.pihooks_SECURITY_PATCH?=2025-01-05 \
    persist.sys.pihooks_DEVICE_INITIAL_SDK_INT?=35

PRODUCT_BUILD_PROP_OVERRIDES += \
    PihooksGmsFp="google/comet_beta/comet:Baklava/BP22.250103.008/12932282:user/release-keys" \
    PihooksGmsModel="Pixel 9 Pro Fold"

PRODUCT_PACKAGES += \
    GameSpace \
    BtHelper 

ifeq ($(ORION_BUILD_TYPE),Official)
PRODUCT_PACKAGES += \
    Updater

endif

ifeq ($(TARGET_SUPPORTS_64_BIT_APPS),true)
PRODUCT_PACKAGES += \
    FaceUnlock
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    ro.face.sense_service=true
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.biometrics.face.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/android.hardware.biometrics.face.xml
endif

# DeviceAsWebcam
ifeq ($(TARGET_BUILD_DEVICE_AS_WEBCAM), true)
    PRODUCT_PACKAGES += \
        DeviceAsWebcam

    PRODUCT_VENDOR_PROPERTIES += \
        ro.usb.uvc.enabled=true
endif

# Cloned app exemption
PRODUCT_COPY_FILES += \
    vendor/lineage/prebuilt/common/etc/sysconfig/preinstalled-packages-platform-orion-product.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/sysconfig/preinstalled-packages-platform-orion-product.xml

# Disable async MTE on a few processes
PRODUCT_SYSTEM_EXT_PROPERTIES += \
    persist.arm64.memtag.app.com.android.se=off \
    persist.arm64.memtag.app.com.google.android.bluetooth=off \
    persist.arm64.memtag.app.com.android.nfc=off \
    persist.arm64.memtag.process.system_server=off

# Private keys
ifeq ($(ORION_BUILD_TYPE),Official)
include vendor/orion-priv/keys/keys.mk
else
-include vendor/orion-priv/keys/keys.mk
endif

