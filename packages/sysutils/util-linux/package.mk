################################################################################
#      This file is part of Alex@ELEC - http://www.alexelec.in.ua
#      Copyright (C) 2011-2016 Alexandr Zuyev (alex@alexelec.in.ua)
################################################################################

PKG_NAME="util-linux"
PKG_VERSION="2.27.1"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL"
PKG_URL="http://www.kernel.org/pub/linux/utils/util-linux/v2.27/$PKG_NAME-$PKG_VERSION.tar.xz"
PKG_DEPENDS_TARGET="toolchain"
PKG_DEPENDS_INIT="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="system"
PKG_SHORTDESC="util-linux: Miscellaneous system utilities for Linux"
PKG_LONGDESC="The util-linux package contains a large variety of low-level system utilities that are necessary for a Linux system to function. Among many features, Util-linux contains the fdisk configuration tool and the login program."

PKG_IS_ADDON="no"
PKG_AUTORECONF="yes"

UTILLINUX_CONFIG_DEFAULT="--disable-gtk-doc \
                          --disable-nls \
                          --disable-rpath \
                          --enable-tls \
                          --disable-all-programs \
                          --enable-chsh-only-listed \
                          --enable-libmount-force-mountinfo \
                          --disable-bash-completion \
                          --disable-colors-default \
                          --disable-pylibmount \
                          --disable-pg-bell \
                          --disable-use-tty-group \
                          --disable-makeinstall-chown \
                          --disable-makeinstall-setuid \
                          --with-gnu-ld \
                          --without-selinux \
                          --without-audit \
                          --without-udev \
                          --without-ncurses \
                          --without-readline \
                          --without-slang \
                          --without-termcap \
                          --without-tinfo \
                          --without-utempter \
                          --without-util \
                          --without-libz \
                          --without-user \
                          --without-systemd \
                          --without-smack \
                          --without-python \
                          --without-systemdsystemunitdir"

PKG_CONFIGURE_OPTS_TARGET="$UTILLINUX_CONFIG_DEFAULT \
                           --enable-libuuid \
                           --enable-libblkid \
                           --enable-libmount \
                           --enable-libsmartcols \
                           --enable-losetup \
                           --enable-fsck \
                           --enable-blkid"

if [ "$SWAP_SUPPORT" = "yes" ]; then
  PKG_CONFIGURE_OPTS_TARGET="$PKG_CONFIGURE_OPTS_TARGET --enable-swapon"
fi

PKG_CONFIGURE_OPTS_HOST="--enable-static \
                         --disable-shared \
                         $UTILLINUX_CONFIG_DEFAULT \
                         --enable-uuidgen \
                         --enable-libuuid"

PKG_CONFIGURE_OPTS_INIT="--prefix=/ \
                         --bindir=/bin \
                         --sbindir=/sbin \
                         --sysconfdir=/etc \
                         --libexecdir=/lib \
                         --localstatedir=/var \
                         $UTILLINUX_CONFIG_DEFAULT \
                         --enable-libblkid \
                         --enable-libmount \
                         --enable-fsck"

if [ "$INITRAMFS_PARTED_SUPPORT" = "yes" ]; then
  PKG_CONFIGURE_OPTS_INIT="$PKG_CONFIGURE_OPTS_INIT --enable-mkfs --enable-libuuid"
fi

post_makeinstall_target() {
  if [ "$SWAP_SUPPORT" = "yes" ]; then
    mkdir -p $INSTALL/usr/lib/alexelec
      cp -PR $PKG_DIR/scripts/mount-swap $INSTALL/usr/lib/alexelec

    mkdir -p $INSTALL/etc
      cat $PKG_DIR/config/swap.conf | \
        sed -e "s,@SWAPFILESIZE@,$SWAPFILESIZE,g" \
            -e "s,@SWAP_ENABLED_DEFAULT@,$SWAP_ENABLED_DEFAULT,g" \
            > $INSTALL/etc/swap.conf
  fi
}

post_install () {
  if [ "$SWAP_SUPPORT" = "yes" ]; then
    enable_service swap.service
  fi
}
