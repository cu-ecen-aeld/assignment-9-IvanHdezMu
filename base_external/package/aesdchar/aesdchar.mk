
##############################################################
#
# AESDCHAR
#
##############################################################

AESDCHAR_VERSION = c07f596c091af83ffbd19a0f517a89dae219e037
AESDCHAR_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-IvanHdezMu.git
AESDCHAR_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

AESDCHAR_MODULE_SUBDIRS = aesd-char-driver/
AESDCHAR_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

$(eval $(kernel-module))

define AESDCHAR_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_load $(TARGET_DIR)/usr/bin/aesdchar_load
	$(INSTALL) -m 0755 $(@D)/aesd-char-driver/aesdchar_unload $(TARGET_DIR)/usr/bin/aesdchar_unload
	
endef
$(eval $(generic-package))
