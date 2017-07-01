TARGET = simulator:clang:latest

include $(THEOS)/makefiles/common.mk
include ../preferenceloader/locatesim.mk

BUNDLE_NAME = SimPref
SimPref_FILES = SimPref.m
SimPref_INSTALL_PATH = /Library/PreferenceBundles
SimPref_PRIVATE_FRAMEWORKS = Preferences
SimPref_FRAMEWORKS = CoreGraphics UIKit

include $(THEOS_MAKE_PATH)/bundle.mk

setup::
	@sudo cp -v $(PWD)/entry.plist $(PL_SIMULATOR_PLISTS_PATH)/$(BUNDLE_NAME).plist
	@sudo cp -vR $(THEOS_OBJ_DIR)/$(BUNDLE_NAME).bundle $(PL_SIMULATOR_BUNDLES_PATH)/

remove::
	@[ ! -d $(PL_SIMULATOR_BUNDLES_PATH)/$(BUNDLE_NAME).bundle ] || sudo rm -rf $(PL_SIMULATOR_BUNDLES_PATH)/$(BUNDLE_NAME).bundle
