TARGET := iphone:clang:latest:14.0
INSTALL_TARGET_PROCESSES = SpringBoard

DEBUG=0
FINALPACKAGE=1

PREFIX=$(THEOS)/toolchain/Xcode.xctoolchain/usr/bin/

SYSROOT=$(THEOS)/sdks/iphoneos14.0.sdk

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = AloMadeMeDoThis

AloMadeMeDoThis_FILES = Tweak.xm
AloMadeMeDoThis_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
