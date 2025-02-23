
##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################
#$(error *** Entering aesd-assignments.mk ***)
#$(shell read -n 1 -s -r -p "Paused for debugging. Execution shifted to aesd-assignments.mk Press any key to continue..."; echo)
$(info *** Starting aesd-assignments package build ***)
#TODO: Fill up the contents below in order to reference your assignment 3 git contents
AESD_ASSIGNMENTS_VERSION = 91cd04a2c925c4f1545b645a9a9776476c574e4c 
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
	$(info Using CROSS_COMPILE=$(TARGET_CROSS))
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/finder-app all
	#$(info TARGET_CROSS=$(TARGET_CROSS))
	#$(info CROSS_COMPILE=$(CROSS_COMPILE))
	$(info Using again CROSS_COMPILE=$(TARGET_CROSS))
	$(info About to cross compile aesdsocket)
	$(MAKE) $(TARGET_CONFIGURE_OPTS) CROSS_COMPILE=$(TARGET_CROSS) -C $(@D)/server aesdsocket
	$(info file $(@D)/server/aesdsocket)
	$(info Executed cross compilation of aesdsocket)
endef

# TODO add your writer, finder and finder-test utilities/scripts to the installation steps below
define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	$(info Installing aesd-assignments to target filesystem)
	$(INSTALL) -d 0755 $(@D)/conf/ $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/
	$(INSTALL) -m 0755 $(@D)/assignment-autotest/test/assignment4/* $(TARGET_DIR)/bin

	# Adding writer, finder, finder-test and aesdsocket to /usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/server/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	$(INSTALL) -D $(@D)/server/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
	chmod +x $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef
$(info *** Evaluating aesd-assignments package ***)

$(eval $(generic-package))
