################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="mpc"
PKG_VERSION="1.0.3"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="LGPL"
PKG_SITE="http://www.multiprecision.org"
PKG_URL="http://www.multiprecision.org/mpc/download/$PKG_NAME-$PKG_VERSION.tar.gz"
PKG_DEPENDS_HOST="ccache:host gmp:host mpfr:host"
PKG_PRIORITY="optional"
PKG_SECTION="devel"
PKG_SHORTDESC="mpc: A C library for the arithmetic of high precision complex numbers"
PKG_LONGDESC="pc is a C library for the arithmetic of complex numbers with arbitrarily high precision and correct rounding of the result. It is built upon and follows the same principles as Mpfr."

PKG_IS_ADDON="no"
PKG_AUTORECONF="no"

PKG_CONFIGURE_OPTS_HOST="--target=$TARGET_NAME \
                         --enable-static --disable-shared \
                         --with-gmp=$ROOT/$TOOLCHAIN \
                         --with-mpfr=$ROOT/$TOOLCHAIN"
