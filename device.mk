#
# Copyright (C) 2011 The CyanogenMod Project
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
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

# common msm7x30 configs bcmdhd
$(call inherit-product, device/htc/msm7x30-common/msm7x30.mk)

# htc audio settings
$(call inherit-product, device/htc/runnymede/media_htcaudio.mk)

$(call inherit-product, frameworks/base/build/phone-hdpi-512-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/htc/runnymede/device-vendor.mk)

# The gps config appropriate for this device

PRODUCT_COPY_FILES += device/common/gps/gps.conf_US:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/runnymede/init.runnymede.rc:root/init.runnymede.rc \
    device/htc/runnymede/ueventd.runnymede.rc:root/ueventd.runnymede.rc

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
    frameworks/base/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/runnymede/device-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.ril.oem.ecclist=112,911 \
    ro.ril.enable.a52=0 \
    ro.ril.enable.a53=1 \
    ro.ril.def.agps.mode=6 \
    htc.audio.alt.enable=1 \
    htc.audio.hac.enable=1 \
    ro.com.google.clientidbase=android-htc \
    ro.com.google.clientidbase.yt=android-htc \
    ro.com.google.clientidbase.am=android-verizon \
    ro.com.google.clientidbase.vs=android-verizon \
    ro.com.google.clientidbase.gmm=android-verizon \      
    ro.com.google.clientidbase.ms=android-verizon \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.2_r8 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y \
    ro.cdma.home.operator.numeric = 310012 \
    ro.cdma.home.operator.alpha = Verizon \
    persist.telephony.support_ipv6=true \
    persist.telephony.support_ipv4=true

# Override /proc/sys/vm/dirty_ratio on UMS
PRODUCT_PROPERTY_OVERRIDES += \
    ro.vold.umsdirtyratio=20

DEVICE_PACKAGE_OVERLAYS += device/htc/runnymede/overlay

# gsm config xml file
PRODUCT_COPY_FILES += \
    device/htc/runnymede/voicemail-conf.xml:system/etc/voicemail-conf.xml \
    device/htc/runnymede/apns-conf.xml:system/etc/apns-conf.xml

# Sensors, GPS, Lights
PRODUCT_PACKAGES += \
    lights.runnymede \
    sensors.runnymede \
    gps.runnymede

# Input device calibration files
PRODUCT_COPY_FILES += \
    device/htc/runnymede/idc/atmel-touchscreen.idc:system/usr/idc/atmel-touchscreen.idc \
    device/htc/runnymede/idc/cy8c-touchscreen.idc:system/usr/idc/cy8c-touchscreen.idc \
    device/htc/runnymede/idc/elan-touchscreen.idc:system/usr/idc/elan-touchscreen.idc \
    device/htc/runnymede/idc/runnymede-keypad.idc:system/usr/idc/runnymede-keypad.idc

# Keychars
PRODUCT_COPY_FILES += \
    device/htc/runnymede/keychars/atmel-touchscreen.kcm:system/usr/keychars/atmel-touchscreen.kcm \
    device/htc/runnymede/keychars/cy8c-touchscreen.kcm:system/usr/keychars/cy8c-touchscreen.kcm \
    device/htc/runnymede/keychars/elan-touchscreen.kcm:system/usr/keychars/elan-touchscreen.kcm

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/runnymede/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/htc/runnymede/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/runnymede/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/runnymede/keylayout/runnymede-keypad.kl:system/usr/keylayout/runnymede-keypad.kl \
    device/htc/runnymede/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
    device/htc/runnymede/keylayout/cy8c-touchscreen.kl:system/usr/keylayout/cy8c-touchscreen.kl \
    device/htc/runnymede/keylayout/elan-touchscreen.kl:system/usr/keylayout/elan-touchscreen.kl

# Device specific firmware
PRODUCT_COPY_FILES += \
    device/htc/runnymede/firmware/bcmdhd.hcd:system/vendor/firmware/bcmdhd.hcd \
    device/htc/runnymede/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/runnymede/firmware/default_mfg.acdb:system/etc/firmware/default_mfg.acdb \
    device/htc/runnymede/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/runnymede/firmware/default_org_nel.acdb:system/etc/firmware/default_org_nel.acdb

# Audio DSP Profiles
PRODUCT_COPY_FILES += \
    device/htc/runnymede/dsp/AdieHWCodec.csv:system/etc/AdieHWCodec.csv \
    device/htc/runnymede/dsp/AdieHWCodec_NEL.csv:system/etc/AdieHWCodec_NEL.csv \
    device/htc/runnymede/dsp/AIC3254_REG.csv:system/etc/AIC3254_REG.csv \
    device/htc/runnymede/dsp/AIC3254_REG_DualMic.csv:system/etc/AIC3254_REG_DualMic.csv \
    device/htc/runnymede/dsp/AIC3254_REG_DualMic_NEL.csv:system/etc/AIC3254_REG_DualMic_NEL.csv \
    device/htc/runnymede/dsp/AIC3254_REG_DualMicXB.csv:system/etc/AIC3254_REG_DualMicXB.csv \
    device/htc/runnymede/dsp/TPA2051_CFG.csv:system/etc/TPA2051_CFG.csv \
    device/htc/runnymede/dsp/TPA2051_CFG_NEL.csv:system/etc/TPA2051_CFG_NEL.csv \
    device/htc/runnymede/dsp/CodecDSPID_BCLK.txt:system/etc/CodecDSPID_BCLK.txt \
    device/htc/runnymede/dsp/CodecDSPID_NEL.txt:system/etc/CodecDSPID_NEL.txt \
    device/htc/runnymede/dsp/CodecDSPID.txt:system/etc/CodecDSPID.txt \
    device/htc/runnymede/dsp/CodecDSPID_WB.txt:system/etc/CodecDSPID_WB.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Bass_Booster.txt:system/etc/soundimage/Sound_Bass_Booster.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Blues.txt:system/etc/soundimage/Sound_Blues.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Classical.txt:system/etc/soundimage/Sound_Classical.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Country.txt:system/etc/soundimage/Sound_Country.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Jazz.txt:system/etc/soundimage/Sound_Jazz.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Latin.txt:system/etc/soundimage/Sound_Latin.txt \
    device/htc/runnymede/dsp/soundimage/Sound_New_Age.txt:system/etc/soundimage/Sound_New_Age.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original_BCLK.txt:system/etc/soundimage/Sound_Original_BCLK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original_Recording_BCLK.txt:system/etc/soundimage/Sound_Original_Recording_BCLK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original_Recording.txt:system/etc/soundimage/Sound_Original_Recording.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original_SPK_BCLK.txt:system/etc/soundimage/Sound_Original_SPK_BCLK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original_SPK.txt:system/etc/soundimage/Sound_Original_SPK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Original.txt:system/etc/soundimage/Sound_Original.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_HP_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_HP_BCLK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_HP.txt:system/etc/soundimage/Sound_Phone_Original_HP.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_REC_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_REC_BCLK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_REC_NEL.txt:system/etc/soundimage/Sound_Phone_Original_REC_NEL.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_REC.txt:system/etc/soundimage/Sound_Phone_Original_REC.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_REC_WB.txt:system/etc/soundimage/Sound_Phone_Original_REC_WB.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_SPK_BCLK.txt:system/etc/soundimage/Sound_Phone_Original_SPK_BCLK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_SPK.txt:system/etc/soundimage/Sound_Phone_Original_SPK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Phone_Original_SPK_WB.txt:system/etc/soundimage/Sound_Phone_Original_SPK_WB.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Piano.txt:system/etc/soundimage/Sound_Piano.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Pop.txt:system/etc/soundimage/Sound_Pop.txt \
    device/htc/runnymede/dsp/soundimage/Sound_R_B.txt:system/etc/soundimage/Sound_R_B.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Recording.txt:system/etc/soundimage/Sound_Recording.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Rock.txt:system/etc/soundimage/Sound_Rock.txt \
    device/htc/runnymede/dsp/soundimage/Sound_SRS_A_HP.txt:system/etc/soundimage/Sound_SRS_A_HP.txt \
    device/htc/runnymede/dsp/soundimage/Sound_SRS_A_SPK.txt:system/etc/soundimage/Sound_SRS_A_SPK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_SRS_V_HP.txt:system/etc/soundimage/Sound_SRS_V_HP.txt \
    device/htc/runnymede/dsp/soundimage/Sound_SRS_V_SPK.txt:system/etc/soundimage/Sound_SRS_V_SPK.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Treble_Booster.txt:system/etc/soundimage/Sound_Treble_Booster.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Vocal_Booster.txt:system/etc/soundimage/Sound_Vocal_Booster.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Rec_Landscape.txt:system/etc/soundimage/Sound_Rec_Landscape.txt \
    device/htc/runnymede/dsp/soundimage/Sound_Rec_Portrait.txt:system/etc/soundimage/Sound_Rec_Portrait.txt \
    device/htc/runnymede/dsp/soundimage/srs_geq10.cfg:system/etc/soundimage/srs_geq10.cfg \
    device/htc/runnymede/dsp/soundimage/srsfx_trumedia_51.cfg:system/etc/soundimage/srsfx_trumedia_51.cfg \
    device/htc/runnymede/dsp/soundimage/srsfx_trumedia_movie.cfg:system/etc/soundimage/srsfx_trumedia_movie.cfg \
    device/htc/runnymede/dsp/soundimage/srsfx_trumedia_music.cfg:system/etc/soundimage/srsfx_trumedia_music.cfg \
    device/htc/runnymede/dsp/soundimage/srsfx_trumedia_voice.cfg:system/etc/soundimage/srsfx_trumedia_voice.cfg
 
PRODUCT_COPY_FILES += \
    device/htc/runnymede/vold.fstab:system/etc/vold.fstab

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/runnymede/media_profiles.xml:system/etc/media_profiles.xml

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/runnymede/prebuilt/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/runnymede/prebuilt/bcmdhd.ko:system/lib/modules/bcmdhd.ko

# Softkey Rotation Script
PRODUCT_COPY_FILES += \
    device/htc/runnymede/rotate_lights.sh:/system/etc/rotate_lights.sh
