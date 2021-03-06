################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="jasper"
PKG_VERSION="1.900.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="OpenSource"
PKG_SITE="http://www.ece.uvic.ca/~mdadams/jasper/"
PKG_URL="$DISTRO_SRC/$PKG_NAME-$PKG_VERSION.tar.bz2"
PKG_DEPENDS_TARGET="toolchain libjpeg-turbo"
PKG_PRIORITY="optional"
PKG_SECTION="graphics"
PKG_SHORTDESC="jasper: JPEG-2000 Part-1 standard (i.e., ISO/IEC 15444-1) implementation"
PKG_LONGDESC="This distribution contains the public release of the an open-source implementation of the ISO/IEC 15444-1 also known as JPEG-2000 standard for image compression."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

PKG_CONFIGURE_OPTS_TARGET="--disable-shared --enable-static"

pre_configure_target() {
  export CFLAGS="$CFLAGS -fPIC -DPIC"
}

post_makeinstall_target() {
  rm -rf $INSTALL/usr/bin
}
