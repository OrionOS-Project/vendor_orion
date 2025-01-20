PRODUCT_VERSION_MAJOR = 15
PRODUCT_VERSION_MINOR = 1

# Increase OrionOS Version with each major release.
ORION_VERSION := Hydroxide
ORION_MAINTAINER ?= Unknown
OFFICIAL_MAINTAINER = $(shell cat vendor/lineage/signed/signed.mk | awk '{ print $$1 }')

# OrionOS version properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.orion.build.version=$(LINEAGE_VERSION) \
    ro.orion.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.orion.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.modversion=$(ORION_VERSION) \
    ro.orion.build.type=$(ORION_BUILD_TYPE) \
    ro.orion.maintainer=$(ORION_MAINTAINER) \
    ro.orion.maintainer_link=$(ORION_MAINTAINER_LINK)

# Check Official
ifndef ORION_BUILD_TYPE
    ORION_BUILD_TYPE := Unofficial
endif

ifdef ORION_MAINTAINER
    ifeq ($(filter $(ORION_MAINTAINER), $(OFFICIAL_MAINTAINER)), $(ORION_MAINTAINER))
        $(warning "$(ORION_MAINTAINER) is verified as official OrionOS Project maintainer, building as official build.")
        ORION_BUILD_TYPE := Official
        PRODUCT_PACKAGES += \
            Updater

        include vendor/orion-priv/keys/keys.mk
    else
        $(warning "Unofficial maintainer detected, building as unofficial build.")
    endif
else
    $(warning "No maintainer name detected, building as unofficial build.")
endif

# Internal version
ifeq ($(WITH_GMS),true)
LINEAGE_VERSION := OrionOS-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(ORION_VERSION)-$(LINEAGE_BUILD)-$(ORION_BUILD_TYPE)-Gapps-$(shell date +%Y%m%d)
else
LINEAGE_VERSION := OrionOS-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(ORION_VERSION)-$(LINEAGE_BUILD)-$(ORION_BUILD_TYPE)-Vanilla-$(shell date +%Y%m%d)
endif

# Display version
LINEAGE_DISPLAY_VERSION := v$(ORION_VERSION)-$(shell date +%Y%m%d)
ORION_BUILD_INFO := $(LINEAGE_VERSION)
