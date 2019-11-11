include $(THEOS)/makefiles/common.mk

BUNDLE_NAME = unlockSound
unlockSound_FILES = unlockSound.mm
unlockSound_INSTALL_PATH = /Library/PreferenceBundles
unlockSound_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/WrongPasscode.plist$(ECHO_END)