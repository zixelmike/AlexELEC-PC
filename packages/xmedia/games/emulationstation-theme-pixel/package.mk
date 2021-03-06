################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="emulationstation-theme-pixel"
PKG_VERSION="37bd4fc"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RetroPie/es-theme-pixel"
PKG_URL="https://github.com/RetroPie/es-theme-pixel/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="es-theme-pixel*"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="Pixel theme for Emulationstation"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : not
}

makeinstall_target() {
  mkdir -p $INSTALL/etc/emulationstation/themes/es-theme-pixel
    cp -r * $INSTALL/etc/emulationstation/themes/es-theme-pixel
}
