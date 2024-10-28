################################################################################
#
# gammastep
#
################################################################################

GAMMASTEP_VERSION = eab8be4fc33e4c4b953252e2a4f24e4f5322b0b1
GAMMASTEP_SITE = https://gitlab.com/chinstrap/gammastep.git
GAMMASTEP_SITE_METHOD = git
GAMMASTEP_LICENSE = GPL
GAMMASTEP_LICENSE_FILES = COPYING

GAMMASTEP_CONF_OPTS = \
	--prefix=/usr \
	--enable-gui=no \
	--enable-wayland=no 

# Override FFMPEG_CONFIGURE_CMDS: FFmpeg does not support --target and others
define GAMMASTEP_CONFIGURE_CMDS
	(cd $(GAMMASTEP_SRCDIR) && ./bootstrap && \
	$(TARGET_CONFIGURE_OPTS) \
	$(TARGET_CONFIGURE_ARGS) \
	./configure \
		--host="$(GNU_TARGET_NAME)" \
		--with-sysroot=$(STAGING_DIR) \
		$(GAMMASTEP_CONF_OPTS) \
	)
endef

$(eval $(autotools-package))
