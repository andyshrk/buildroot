################################################################################
#
# iotools
#
################################################################################

IOTOOLS_VERSION = v1.7
IOTOOLS_SITE = $(call github,andy-shev,iotools,$(IOTOOLS_VERSION))
IOTOOLS_LICENSE = GPL-2.0+
IOTOOLS_LICENSE_FILES = COPYING

define IOTOOLS_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) -C $(@D) CROSS_COMPILE=$(TARGET_CROSS) all
endef

define IOTOOLS_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -t $(TARGET_DIR)/usr/bin -D $(@D)/iotools
endef

$(eval $(generic-package))
