#
# Copyright (C) 2013 The CyanogenMod Project
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

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# Specific overlay
DEVICE_PACKAGE_OVERLAYS += device/lge/w55ds/overlay

PRODUCT_PACKAGES += Torch

# NFC packages
PRODUCT_PACKAGES += \
    NfcNci \
    Tag \
    nfc_nci.pn54x.default \
    com.android.nfc_extras

NFCEE_ACCESS_PATH := device/lge/w55ds/prebuilt/etc/nfcee_access.xml

PRODUCT_PROPERTY_OVERRIDES += \
    ro.sf.lcd_density=240
    ro.product.device=w55ds \
    ro.product.model=LG-D285 \
    persist.radio.multisim.config=dsds \
    persist.panel.orientation=0 \
    ro.sf.hwrotation=180 \
    camera2.portability.force_api=0

PRODUCT_COPY_FILES += \
    device/lge/w55ds/mixer_paths.xml:system/etc/mixer_paths.xml \
    device/lge/w55ds/prebuilt/etc/thermal-engine-8610.conf:system/etc/thermal-engine-8610.conf \
    frameworks/native/data/etc/android.hardware.nfc.xml:system/etc/permissions/android.hardware.nfc.xml \
    frameworks/native/data/etc/android.hardware.nfc.hce.xml:system/etc/permissions/android.hardware.nfc.hce.xml \
    frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
    device/lge/w55ds/prebuilt/etc/libnfc-brcm.conf:system/etc/libnfc-brcm.conf \
    device/lge/w55ds/prebuilt/etc/nfc-nci.conf:system/etc/nfc-nci.conf \
    device/lge/w55ds/prebuilt/etc/libnfc-nxp.conf:system/etc/libnfc-nxp.conf \
    device/lge/w55ds/prebuilt/etc/nfcee_access.xml:system/etc/nfcee_access.xml \
    device/lge/w55ds/prebuilt/usr/keylayout/Generic-D285.kl:system/usr/keylayout/Generic-D285.kl \
    device/lge/w55ds/fstab.msm8610:root/fstab.msm8610

PRODUCT_LOCALES := en_US
PRODUCT_LOCALES += hdpi
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# OTA
PRODUCT_COPY_FILES += \
    device/lge/w55ds/prebuilt/fixup.sh:fixup.sh

$(call inherit-product, vendor/lge/w55ds/w55ds-vendor.mk)

# Inherit from msm8610-common
$(call inherit-product, device/lge/msm8610-common/msm8610.mk)
