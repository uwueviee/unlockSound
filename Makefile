include $(THEOS)/makefiles/common.mk

TWEAK_NAME = unlockSound
unlockSound_FILES = Tweak.xm
unlocksound_FRAMEWORKS = UIKit
unlockSound_EXTRA_FRAMEWORKS = Cephei CepheiPrefs

BUNDLE_NAME = gq.skye.unlocksound
gq.skye.unlocksound_INSTALL_PATH = /Library/MobileSubstrate/DynamicLibraries

include $(THEOS)/makefiles/bundle.mk
include $(THEOS_MAKE_PATH)/tweak.mk
SUBPROJECTS += unlockSound
include $(THEOS_MAKE_PATH)/aggregate.mk

after-install::
	install.exec "killall -9 SpringBoard"
