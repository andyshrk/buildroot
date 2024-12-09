################################################################################
#
# ddcutil
#
################################################################################
DDCUTIL_VERSION = v2.1.4
DDCUTIL_SITE = https://github.com/rockowitz/ddcutil
DDCUTIL_SITE_METHOD = git

DDCUTIL_AUTORECONF = YES

DDCUTIL_CONF_OPTS = \
    --enable-x11=no

DDCUTIL_DEPENDENCIES = host-pkgconf jansson libusb

$(eval $(autotools-package))
