PRODUCT_RELEASE_NAME := Inc2

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/gsm.mk)
$(call inherit-product, vendor/cm/config/cdma.mk)

$(call inherit-product, device/htc/runnymede/full_runnymede.mk)

PRODUCT_BUILD_PROP_OVERRIDES += PRODUCT_NAME=htc_runnymede BUILD_ID=IML74K BUILD_DISPLAY_ID=IML74K BUILD_FINGERPRINT=verizon_wwe/htc_runnymede/runnymede:2.3.4/GRJ22/120826.3:user/release-keys PRIVATE_BUILD_DESC="4.08.605.3 CL120826 release-keys"

PRODUCT_NAME := cm_runnymede
PRODUCT_DEVICE := runnymede
