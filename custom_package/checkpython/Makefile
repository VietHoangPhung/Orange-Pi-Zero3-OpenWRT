include $(TOPDIR)/rules.mk

PKG_NAME:=checkpython
PKG_VERSION:=1.0
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/checkpython
  SECTION:=utils
  CATEGORY:=Utilities
  TITLE:=Check Python 3 Version
endef

define Package/checkpython/description
  Simple utility to detect and log Python 3 version.
endef

define Build/Compile
	$(TARGET_CC) $(PKG_BUILD_DIR)/check_python.c -o $(PKG_BUILD_DIR)/checkpython
endef

define Package/checkpython/install
	$(INSTALL_DIR) $(1)/usr/bin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/checkpython $(1)/usr/bin/
endef

$(eval $(call BuildPackage,checkpython))
