
FILESEXTRAPATHS_prepend_nanopi-neo-air := "${THISDIR}/files/nanopi-neo-air:"
FILESEXTRAPATHS_prepend_gridless-mini := "${THISDIR}/files/gridless-mini:"

RDEPENDS_${PN}_append = " kmod"