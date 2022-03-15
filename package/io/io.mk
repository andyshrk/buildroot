################################################################################
#
# io
#
################################################################################

IO_VERSION = master
IO_SITE = $(call github,andyshrk,io,$(IO_VERSION))
IO_LICENSE = GPL-2.0+
IO_LICENSE_FILES = COPYING.GPL

define IO_BUILD_CMDS
	$(TARGET_CC) $(TARGET_CFLAGS) $(TARGET_LDFLAGS) $(@D)/io.c -o $(@D)/io
endef

define IO_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 -D $(@D)/io $(TARGET_DIR)/usr/bin/io
endef

$(eval $(generic-package))
