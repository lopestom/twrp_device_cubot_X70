# Copyright (C) 2023 The Android Open Source Project
# Copyright (C) 2023 TeamWin Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# Configure launch_with_vendor_ramdisk.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/virtual_ab_ota/launch_with_vendor_ramdisk.mk)

# Configure core_64_bit.mk
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)

# Inherit from those products. Most specific first.
#$(call inherit-product, $(SRC_TARGET_DIR)/product/aosp_base.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/base.mk)

# Installs gsi keys into ramdisk, to boot a developer GSI with verified boot.
$(call inherit-product, $(SRC_TARGET_DIR)/product/gsi_keys.mk)

# Inherit from our custom product configuration.
$(call inherit-product, vendor/twrp/config/common.mk)

# Device specific configs.
$(call inherit-product, device/cubot/X70/device.mk)

## Device identifier. This must come after all inclusions.
PRODUCT_DEVICE := X70
PRODUCT_NAME := twrp_X70
PRODUCT_BRAND := CUBOT
PRODUCT_MODEL := X70
PRODUCT_MANUFACTURER := CUBOT
PRODUCT_RELEASE_NAME := CUBOT X70

PRODUCT_BUILD_PROP_OVERRIDES += \
    TARGET_DEVICE=X70 \
    PRODUCT_NAME=X70_EEA \
    PRIVATE_BUILD_DESC="vext_k6789v1_64-user 12 SP1A.210812.016 1rck61v164bspP24 release-keys"

BUILD_FINGERPRINT := CUBOT/X70_EEA/X70:12/SP1A.210812.016/1686218748:user/release-keys

#ro.build.version.base_os=CUBOT/X70_EEA/X70:12/SP1A.210812.016/1683612689:user/release-keys
