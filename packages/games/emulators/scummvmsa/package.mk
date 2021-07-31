# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2019-present Shanti Gilbert (https://github.com/shantigilbert)
# Copyright (C) 2020-present Fewtarius

PKG_NAME="scummvmsa"
PKG_VERSION="832791407cd4a1a0ebd067a4b879eb680cc53b9e"
PKG_SHA256="e747b4eb3d8df2f7393a79f28a846b3b6c7e04779b9eb0885d24243abf9677c6"
PKG_REV="1"
PKG_LICENSE="GPL2"
PKG_SITE="https://github.com/scummvm/scummvm"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2 SDL2_net freetype fluidsynth-git"
PKG_SHORTDESC="Script Creation Utility for Maniac Mansion Virtual Machine"
PKG_LONGDESC="ScummVM is a program which allows you to run certain classic graphical point-and-click adventure games, provided you already have their data files."

pre_configure_target() { 
  sed -i "s|sdl-config|sdl2-config|g" $PKG_BUILD/configure
  TARGET_CONFIGURE_OPTS="--host=${TARGET_NAME} --backend=sdl --enable-optimizations --opengl-mode=gles2 --with-sdl-prefix=${SYSROOT_PREFIX}/usr/bin --enable-vkeybd"
}

post_makeinstall_target() {
  mkdir -p $INSTALL/usr/config/scummvm/extra 
  cp -rf $PKG_DIR/config/* $INSTALL/usr/config/scummvm/
  cp -rf $PKG_BUILD/backends/vkeybd/packs/*.zip $INSTALL/usr/config/scummvm/extra

  mv $INSTALL/usr/local/bin $INSTALL/usr/
  cp -rf $PKG_DIR/bin/* $INSTALL/usr/bin
  chmod 755 $INSTALL/usr/bin/*
	
  for i in appdata applications doc icons man; do
    rm -rf "$INSTALL/usr/local/share/$i"
  done
 
}

