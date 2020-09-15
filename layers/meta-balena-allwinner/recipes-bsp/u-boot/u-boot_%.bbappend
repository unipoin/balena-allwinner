UBOOT_KCONFIG_SUPPORT = "1"
inherit resin-u-boot
FILESEXTRAPATHS_append := ":${THISDIR}/files"

# remove the resin-specific-env-integration-kconfig.patch patch from
# meta-sunxi because it fails to apply
SRC_URI_remove = "file://resin-specific-env-integration-kconfig.patch"

# Add re-worked patch resin-specific-env-integration-kconfig_reworked.patch
SRC_URI_append = " \
		file://0001-Add-Resin-specific-boot-command.patch \
		file://resin-specific-env-integration-kconfig_reworked.patch \
		file://0002-Change_CONFIG_SYS_BOOTM_LEN_to_64M.patch \
		"

SRC_URI_remove = "file://0001-nanopi_neo_air_defconfig-Enable-eMMC-support.patch"
SRC_URI_append_nanopi_neo_air = "file://0001-nanopi_neo_air_defconfig-Enable-eMMC-support.patch"

SRC_URI_append_gridless-mini = "file://0003-add_gridless_mini_defconfig.patch \
				file://0004-add_gridless_mini_dts.patch \
		"
#				file://0005-sun8i-add-usb-phy-select.patch \