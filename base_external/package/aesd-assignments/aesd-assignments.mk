
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################
#$(error *** Entering aesd-assignments.mk ***)
$(shell read -n 1 -s -r -p "Paused for debugging. Execution shifted to aesd-assignments.mk Press any key to continue..."; echo)
$(info *** Starting aesd-assignments package build ***)
#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = ef4c2ba79b917f60addd50b0f23bfafdeb95f548
# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:
$(info Fetching source from $(AESD_ASSIGNMENTS_SITE))
AESD_ASSIGNMENTS_SITE = git@github.com:cu-ecen-aeld/assignments-3-and-later-jainaneesh.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES
PKG_NAME = aesd-assignments
define AESD_ASSIGNMENTS_BUILD_CMDS
	$(info Running build commands for aesd-assignments)
	$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/finder-app all
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(info Installing aesd-assignments to target filesystem)
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin

	# Adding writer, finder and finder-test to /usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
endef
$(info *** Evaluating aesd-assignments package ***)

$(eval $(generic-package))
