$(info *** Processing base_external/external.mk ***)
#BR2_EXTERNAL_PROJECT_BASE_PATH := $(call qstrip,$(BR2_EXTERNAL_PROJECT_BASE))
BR2_EXTERNAL_PROJECT_BASE_PATH := /home/linux-o-phile/assignment-4-jainaneesh/base_external
BR2_EXTERNAL += $(BR2_EXTERNAL_PROJECT_BASE_PATH)
$(info *** Debugging external.mk: BR2_EXTERNAL=$(BR2_EXTERNAL) ***)
$(info *** Debugging package directory: $(BR2_EXTERNAL)/package/aesd-assignments ***)
include $(BR2_EXTERNAL_PROJECT_BASE_PATH)/package/aesd-assignments/aesd-assignments.mk
$(info *** Debugging external.mk: BR2_EXTERNAL_PROJECT_BASE_PATH=$(BR2_EXTERNAL_PROJECT_BASE_PATH) ***)
$(info BR2_EXTERNAL=$(BR2_EXTERNAL))

