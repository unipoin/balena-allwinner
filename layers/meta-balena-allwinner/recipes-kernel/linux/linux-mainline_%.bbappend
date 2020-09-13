inherit kernel-resin
inherit kernel-devicetree

PACKAGES =+ "${PN}-fixup-scr"

SRC_URI_remove = "file://0003-ARM-dts-nanopi-neo-air-Add-WiFi-eMMC.patch"

FILESEXTRAPATHS_prepend := "${THISDIR}/files:"

SRC_URI_append_nanopi-neo-air = " \
    file://nanopi-neo-air/0001-linux-mainline-Add-back-eMMC-support-for-Nanopi-Neo-.patch \
    file://nanopi-neo-air/board-nanopiair-h3-camera-wifi-bluetooth-otg.patch \
"

SRC_URI_remove_gridless-mini = "file://0001-dts-orange-pi-zero-Add-wifi-support.patch"

SRC_URI_append_gridless-mini = " \
    file://gridless-mini/0001_add_gridless_mini_b3e_dts_files.patch \
    file://gridless-mini/rs485-8250_dw_new.patch \
"

SRC_URI_append = " \
    file://general-add-configfs-overlay.patch \
    file://general-add-overlay-compilation-support.patch \
    file://general-sunxi-overlays.patch \
    file://0001-arch-arm-Makefile-Partial-revert-of-https-github.com.patch \
"

RESIN_CONFIGS_append = " axp_power"
RESIN_CONFIGS_DEPS[axp_power] = "\
    CONFIG_TOUCHSCREEN_SUN4I=n \
    CONFIG_IIO=y \
    CONFIG_REGMAP_IRQ=y \
    CONFIG_MFD_SUN4I_GPADC=y \
    CONFIG_MFD_AXP20X=y \
    CONFIG_MFD_AXP20X_I2C=y \
"
RESIN_CONFIGS[axp_power] ="\
    CONFIG_AXP20X_POWER=y \
"

RESIN_CONFIGS_append_orangepi-plus2 = " wifi"
RESIN_CONFIGS_append_orange-pi-zero = " wifi"
RESIN_CONFIGS_append_orange-pi-lite = " wifi"
RESIN_CONFIGS_append_nanopi-neo-air = " wifi"
RESIN_CONFIGS_append_gridless-mini = " wifi"
RESIN_CONFIGS_append_bananapi-m1-plus = " wifi"

RESIN_CONFIGS[wifi] ="\
    CONFIG_WIRELESS=y \
    CONFIG_RFKILL=y \
    CONFIG_CFG80211=m \
    CONFIG_CFG80211_WEXT=y \
    CONFIG_WLAN=y \
    CONFIG_WLAN_VENDOR_REALTEK=y \
"

RESIN_CONFIGS_append_orangepi-plus2 = " pl2303"
RESIN_CONFIGS_DEPS[pl2303] = "\
    CONFIG_USB_SERIAL=m \
"
RESIN_CONFIGS[pl2303] ="\
    CONFIG_USB_SERIAL_PL2303=m \
"

RESIN_CONFIGS_append_gridless-mini = " sunxi_network"
RESIN_CONFIGS[sunxi_network] = "\
	CONFIG_STMMAC_ETH=m \
"
RESIN_CONFIGS_append_gridless-mini = " gridless_usb"
RESIN_CONFIGS[gridless_usb] = "\
	CONFIG_USB_HID=m \
	CONFIG_USB=y \
	CONFIG_USB_ANNOUNCE_NEW_DEVICES=y \
	CONFIG_USB_EHCI_HCD=y \
	CONFIG_USB_EHCI_HCD_PLATFORM=y \
	CONFIG_USB_OHCI_HCD=y \
	CONFIG_USB_OHCI_HCD_PLATFORM=y \
	CONFIG_USB_ACM=m \
	CONFIG_USB_STORAGE=m \
	CONFIG_USB_MUSB_HDRC=y \
	CONFIG_NOP_USB_XCEIV=m \
	CONFIG_USB_MUSB_SUNXI=m \
	CONFIG_USB_NET_DRIVERS=m \
	CONFIG_USB_USBNET=m \
	CONFIG_BRCMFMAC=m \
	CONFIG_RT2500USB=m \
	CONFIG_RT73USB=m \
	CONFIG_RT2800USB=m \
	CONFIG_RT2800USB_RT3573=y \
	CONFIG_RT2800USB_RT53XX=y \
	CONFIG_RT2800USB_RT55XX=y \
	CONFIG_RT2800USB_UNKNOWN=y \
	CONFIG_RTL8187=m \
	CONFIG_RTL8192CU=m \
	CONFIG_SERIO=y \
	CONFIG_SERIAL_OF_PLATFORM=y \
	CONFIG_SERIAL_DEV_BUS=y \
	CONFIG_USB_SERIAL=m \
	CONFIG_USB_SERIAL_GENERIC=y \
	CONFIG_USB_SERIAL_SIMPLE=m \
	CONFIG_USB_SERIAL_ARK3116=m \
	CONFIG_USB_SERIAL_BELKIN=m \
	CONFIG_USB_SERIAL_CH341=m \
	CONFIG_USB_SERIAL_WHITEHEAT=m \
	CONFIG_USB_SERIAL_DIGI_ACCELEPORT=m \
	CONFIG_USB_SERIAL_CP210X=m \
	CONFIG_USB_SERIAL_CYPRESS_M8=m \
	CONFIG_USB_SERIAL_FTDI_SIO=m \
	CONFIG_USB_SERIAL_F81232=m \
	CONFIG_USB_SERIAL_GARMIN=m \
	CONFIG_USB_SERIAL_MCT_U232=m \
	CONFIG_USB_SERIAL_MOS7720=m \
	CONFIG_USB_SERIAL_MOS7840=m \
	CONFIG_USB_SERIAL_MXUPORT=m \
	CONFIG_USB_SERIAL_NAVMAN=m \
	CONFIG_USB_SERIAL_PL2303=m \
	CONFIG_USB_SERIAL_OTI6858=m \
	CONFIG_USB_SERIAL_TI=m \
	CONFIG_USB_SERIAL_XIRCOM=m \
	CONFIG_USB_SERIAL_OPTION=m \
	CONFIG_USB_SERIAL_SSU100=m \
	CONFIG_USB_SERIAL_QT2=m \
"

RESIN_CONFIGS_append_gridless-mini = " leds"
RESIN_CONFIGS[leds] = "\
	CONFIG_NEW_LEDS=y \
	CONFIG_LEDS_CLASS=y \
	CONFIG_LEDS_GPIO=y \
	CONFIG_LEDS_TRIGGERS=y \
	CONFIG_LEDS_TRIGGER_TIMER=y \
	CONFIG_LEDS_TRIGGER_HEARTBEAT=y \
	CONFIG_LEDS_TRIGGER_DEFAULT_ON=y \
	CONFIG_LEDS_TRIGGER_PANIC=y \
	CONFIG_LEDS_TRIGGER_SYNC_BLINK=y \
	CONFIG_LED_TRIGGER_PHY=y \
"

RESIN_CONFIGS_append_gridless-mini = " i2c"
RESIN_CONFIGS[i2c] = "\
	CONFIG_EEPROM_AT24=m \
	CONFIG_RTC_DRV_PCF8523=m \
	CONFIG_SENSORS_LM75=m \
"

RESIN_CONFIGS_append_gridless-mini = " network_switch"
RESIN_CONFIGS[network_switch] = "\
	CONFIG_NET_DSA=m \
	CONFIG_NET_DSA_MICROCHIP_KSZ8795=m \
	CONFIG_NET_DSA_MICROCHIP_KSZ8795_SPI=m \
	CONFIG_NET_DSA_MICROCHIP_KSZ_COMMON=m \
	CONFIG_NET_VENDOR_MICREL=y \
	CONFIG_NET_VENDOR_MICROCHIP=y \
	CONFIG_SPI_SUN4I=y \
	CONFIG_SPI_SUN6I=y \
	CONFIG_SPI=y \
	CONFIG_SPI_MASTER=y \
	CONFIG_SPI_SPIDEV=y \
	CONFIG_MICREL_KS8995MA=y \
"

RESIN_CONFIGS_append_gridless-mini = " gpio_button"
RESIN_CONFIGS[gpio_button] = "\
	CONFIG_KEYBOARD_GPIO=y \
"


RESIN_CONFIGS_append_orangepi-plus2 = " hdmi"
RESIN_CONFIGS_DEPS[hdmi] = "\
    CONFIG_SUN8I_DE2_CCU=y \
"
RESIN_CONFIGS[hdmi] ="\
    CONFIG_DRM_SUN8I_DW_HDMI=y \
"

RESIN_CONFIGS_append = " huawei_modems"
RESIN_CONFIGS_DEPS[huawei_modems] = "\
    CONFIG_USB_SERIAL_OPTION=m \
    CONFIG_USB_USBNET=m \
"
RESIN_CONFIGS[huawei_modems] ="\
    CONFIG_USB_NET_HUAWEI_CDC_NCM=m \
"

RESIN_CONFIGS_append = " cp210x"
RESIN_CONFIGS[cp210x] ="\
    CONFIG_USB_SERIAL_CP210X=m \
"

RESIN_CONFIGS_append_orange-pi-lite = " \
    8189fs \
    "

RESIN_CONFIGS[8189fs] ?= " \
    CONFIG_RTL8189FS=m \
"

RESIN_CONFIGS_append = " \
    configfs \
"

RESIN_CONFIGS[configfs] = " \
    CONFIG_OF_CONFIGFS=y \
    CONFIG_OF_OVERLAY=y \
    CONFIG_CONFIGFS_FS=y \
"

RESIN_CONFIGS_append_nanopi-neo-air = " hciuart"
RESIN_CONFIGS_DEPS[hciuart] = " \
    CONFIG_BT=m \
"
RESIN_CONFIGS[hciuart] = " \
    CONFIG_BT_HCIUART=m \
    CONFIG_BT_HCIUART_H4=y \
"

FILES_${PN}-fixup-scr = " \
    /boot/sun8i-h3-fixup.scr \
"

KERNEL_DEVICETREE_gridless-mini = " \
    sun8i-h3-gridless-mini-B3E.dtb \
"

KERNEL_DEVICETREE_orange-pi-zero_append = " \
    sun8i-h2-plus-orangepi-zero.dtb \
    overlay/sun8i-h3-analog-codec.dtbo \
    overlay/sun8i-h3-cir.dtbo \
    overlay/sun8i-h3-fixup.scr \
    overlay/sun8i-h3-i2c0.dtbo \
    overlay/sun8i-h3-i2c1.dtbo \
    overlay/sun8i-h3-i2c2.dtbo \
    overlay/sun8i-h3-pps-gpio.dtbo \
    overlay/sun8i-h3-pwm.dtbo \
    overlay/sun8i-h3-spdif-out.dtbo \
    overlay/sun8i-h3-spi-add-cs1.dtbo \
    overlay/sun8i-h3-spi-jedec-nor.dtbo \
    overlay/sun8i-h3-spi-spidev.dtbo \
    overlay/sun8i-h3-uart1.dtbo \
    overlay/sun8i-h3-uart2.dtbo \
    overlay/sun8i-h3-uart3.dtbo \
    overlay/sun8i-h3-usbhost0.dtbo \
    overlay/sun8i-h3-usbhost2.dtbo \
    overlay/sun8i-h3-usbhost3.dtbo \
    overlay/sun8i-h3-w1-gpio.dtbo \
    "
