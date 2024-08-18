PRODUCT_VERSION_MAJOR = 15
PRODUCT_VERSION_MINOR = 1

# Increase OrionOS Version with each major release.
ORION_VERSION := Hydroxide
ORION_BUILD_TYPE ?= Unofficial

# Internal version
ifeq ($(WITH_GMS),true)
LINEAGE_VERSION := OrionOS-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-$(ORION_VERSION)-$(ORION_BUILD_TYPE)
else
LINEAGE_VERSION := OrionOS-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-$(ORION_VERSION)-Vanilla-$(ORION_BUILD_TYPE)
endif

# Display version
LINEAGE_DISPLAY_VERSION := v$(ORION_VERSION)-$(shell date +%Y%m%d)

# OrionOS version properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.orion.build.version=$(LINEAGE_VERSION) \
    ro.orion.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.orion.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(ORION_VERSION)
