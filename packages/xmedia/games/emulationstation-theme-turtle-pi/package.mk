################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="emulationstation-theme-turtle-pi"
PKG_VERSION="9f57155"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/RetroPie/es-theme-turtle-pi"
PKG_URL="https://github.com/RetroPie/es-theme-turtle-pi/archive/$PKG_VERSION.tar.gz"
PKG_SOURCE_DIR="es-theme-turtle-pi*"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="xmedia/games"
PKG_SHORTDESC="Turtle-Pi theme for Emulationstation"
PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

make_target() {
  : not
}

makeinstall_target() {
  mkdir -p $INSTALL/etc/emulationstation/themes/es-theme-turtle-pi
    cp -r * $INSTALL/etc/emulationstation/themes/es-theme-turtle-pi
}
