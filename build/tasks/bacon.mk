# Copyright (C) 2017 Unlegacy-Android
# Copyright (C) 2017,2020 The LineageOS Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

ORION_TARGET_PACKAGE := $(PRODUCT_OUT)/orion-$(ORION_VERSION).zip

SHA256 := prebuilts/build-tools/path/$(HOST_PREBUILT_TAG)/sha256sum

.PHONY: bacon
bacon: $(INTERNAL_OTA_PACKAGE_TARGET)
	$(hide) ln -f $(INTERNAL_OTA_PACKAGE_TARGET) $(ORION_TARGET_PACKAGE)
	$(hide) $(SHA256) $(ORION_TARGET_PACKAGE) | sed "s|$(PRODUCT_OUT)/||" > $(ORION_TARGET_PACKAGE).sha256sum
	@echo -e ${CL_CYN}""${CL_CYN}
	@echo -e ${CL_CYN}"------------------------------------------"${CL_CYN}
	@echo -e ${CL_CYN}"   ____       _              ____   _____ "${CL_CYN}
	@echo -e ${CL_CYN}"  / __ \     (_)            / __ \ / ____|"${CL_CYN}
	@echo -e ${CL_CYN}" | |  | |_ __ _  ___  _ __ | |  | | |___  "${CL_CYN}
	@echo -e ${CL_CYN}" | |  | | '__| |/ _ \| '_ \| |  | |\___ \ "${CL_CYN}
	@echo -e ${CL_CYN}" | |__| | |  | | (_) | | | | |__| |____/ |"${CL_CYN}
	@echo -e ${CL_CYN}"  \____/|_|  |_|\___/|_| |_|\____/|_____/ "${CL_CYN}
	@echo -e ${CL_CYN}"------------------------------------------"${CL_CYN}   
	@echo -e ${CL_CYN}""${CL_CYN}
	@echo -e ${CL_CYN}"===================================-Package Completed-=============================="${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Zip: "${CL_YLW} $(ORION_TARGET_PACKAGE)${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"SHA256: "${CL_YLW}" `sha256sum $(ORION_TARGET_PACKAGE) | cut -d ' ' -f 1` "${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Size: "${CL_YLW}" `ls -l $(ORION_TARGET_PACKAGE) | cut -d ' ' -f 5` "${CL_RST}
	@echo -e ${CL_BLD}${CL_YLW}"Timestamp: "${CL_MAG} $(ORION_BUILD_DATE_UTC) ${CL_RST}
	@echo -e ${CL_CYN}"===========-----Thank you for being a member of OrionOS-Project Family-----==========="${CL_RST}
	@echo -e ""