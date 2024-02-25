include vendor/orion/config/BoardConfigKernel.mk

ifeq ($(BOARD_USES_QCOM_HARDWARE),true)
include vendor/orion/config/BoardConfigQcom.mk
endif

include vendor/orion/config/BoardConfigSoong.mk
