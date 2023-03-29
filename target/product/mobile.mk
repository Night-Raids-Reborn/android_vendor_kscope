#
# Copyright (C) 2022 Project Kaleidoscope
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit common Kaleidoscope stuff
$(call inherit-product, vendor/kscope/target/product/common_no_telephony.mk)

# Data roaming
PRODUCT_SYSTEM_DEFAULT_PROPERTIES += \
    ro.com.android.dataroaming=false

# World APN list
PRODUCT_COPY_FILES += \
    vendor/kscope/target/config/apns-conf.xml:$(TARGET_COPY_OUT_SYSTEM)/etc/apns-conf.xml

# Telephony packages
PRODUCT_PACKAGES += \
    messaging \
    Stk
# Custom Settings Permissions
PRODUCT_COPY_FILES += \
    vendor/kscope/target/config/permissions/privapp-permissions-davincicode-system_ext.xml:$(TARGET_COPY_OUT_SYSTEM_EXT)/etc/permissions/privapp-permissions-davincicode-system_ext.xml

# Ad-block hosts
PRODUCT_PACKAGES += \
    hosts.aicp_adblock

# Include Lawnchair
ifeq ($(USE_LAWNCHAIR), true)
$(call inherit-product, vendor/lawnchair/lawnchair.mk)
endif