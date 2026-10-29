DEBUG = 0
FINALPACKAGE = 1

ARCHS = arm64 arm64e

# Share the SDK and deployment targets with the PreferenceBundle.
include AxsYouYouToolboxBuild.mk
include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AxsYouYouToolbox
AxsYouYouToolbox_FILES = $(wildcard Hooks/*.xm Sources/*.m)
AxsYouYouToolbox_CFLAGS = -fobjc-arc -I./Headers -I./Sources
AxsYouYouToolbox_FRAMEWORKS = UIKit Foundation CoreFoundation
AxsYouYouToolbox_LIBRARIES = substrate

include $(THEOS_MAKE_PATH)/tweak.mk

SUBPROJECTS += AxsYouYouToolboxPrefs
include $(THEOS_MAKE_PATH)/aggregate.mk
