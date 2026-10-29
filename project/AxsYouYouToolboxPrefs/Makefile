include ../AxsYouYouToolboxBuild.mk
include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = AxsYouYouToolboxPrefs
AxsYouYouToolboxPrefs_FILES = $(wildcard *.m)
AxsYouYouToolboxPrefs_CFLAGS = -fobjc-arc -I../Sources
AxsYouYouToolboxPrefs_FRAMEWORKS = UIKit Foundation CoreFoundation
AxsYouYouToolboxPrefs_PRIVATE_FRAMEWORKS = Preferences
AxsYouYouToolboxPrefs_INSTALL_PATH = /Library/PreferenceBundles

include $(THEOS_MAKE_PATH)/bundle.mk
