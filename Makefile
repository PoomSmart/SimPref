TARGET = simulator:clang:latest
ARCHS = arm64
# ARCHS = x86_64 i386 # for Intel Mac

include $(THEOS)/makefiles/common.mk
include ../preferenceloader-sim/locatesim.mk

TWEAK_NAME = SimPrefTweak
SimPrefTweak_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

BUNDLE_NAME = SimPref
SimPref_FILES = SimPref.m
SimPref_INSTALL_PATH = /Library/PreferenceBundles
SimPref_CFLAGS = -fobjc-arc
SimPref_PRIVATE_FRAMEWORKS = Preferences
SimPref_FRAMEWORKS = CoreGraphics UIKit

include $(THEOS_MAKE_PATH)/bundle.mk

setup:: all
	@cp -v $(THEOS_OBJ_DIR)/$(TWEAK_NAME).dylib /opt/simject
	@cp -v $(PWD)/$(TWEAK_NAME).plist /opt/simject
	@sudo cp -v $(PWD)/entry.plist $(PL_SIMULATOR_PLISTS_PATH)/$(BUNDLE_NAME).plist
	@sudo cp -vR $(THEOS_OBJ_DIR)/$(BUNDLE_NAME).bundle $(PL_SIMULATOR_BUNDLES_PATH)/

remove::
	@rm -f /opt/simject/$(TWEAK_NAME).dylib /opt/simject/$(TWEAK_NAME).plist
	@[ ! -d $(PL_SIMULATOR_BUNDLES_PATH)/$(BUNDLE_NAME).bundle ] || sudo rm -rf $(PL_SIMULATOR_BUNDLES_PATH)/$(BUNDLE_NAME).bundle
