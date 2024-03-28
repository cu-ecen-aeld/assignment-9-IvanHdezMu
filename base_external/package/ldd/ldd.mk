
##############################################################
#
# LDD
#
##############################################################

LDD_VERSION = 'ed492d82d9d3ffbfc2ab6fefd2c24062994a1821'
LDD_SITE = 'git@github.com:cu-ecen-aeld/assignment-7-IvanHdezMu.git'
LDD_SITE_METHOD = git

LDD_MODULE_SUBDIRS = misc-modules/
LDD_MODULE_SUBDIRS += scull/
LDD_MODULE_MAKE_OPTS = KVERSION=$(LINUX_VERSION_PROBED)

$(eval $(kernel-module))

define LDD_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/scull/scull_load $(TARGET_DIR)/usr/bin/scull_load
	$(INSTALL) -m 0755 $(@D)/scull/scull_unload $(TARGET_DIR)/usr/bin/scull_unload
	
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_load $(TARGET_DIR)/usr/bin/module_load
	$(INSTALL) -m 0755 $(@D)/misc-modules/module_unload $(TARGET_DIR)/usr/bin/module_unload
endef
$(eval $(generic-package))
