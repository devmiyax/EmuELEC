# SPDX-License-Identifier: GPL-2.0-or-later
# Copyright (C) 2020-present Shanti Gilbert (https://github.com/shantigilbert)

PKG_NAME="hydracastlelabyrinth"
PKG_VERSION="e112bdb3185bcb314263543aff87db66795f85ff"
PKG_SHA256="bd7d594b0330b2ac0de2409dd18f48d357896fd20e5b8146244e3beea21f0203"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPL2"
PKG_SITE="https://github.com/ptitSeb/hydracastlelabyrinth"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain SDL2 SDL2_mixer libogg timidity"
PKG_LONGDESC="A port to Linux (and OpenPandora / DragonBox Pyra / ODroid / PocketCHIP / GameShell / AmigaOS4 / MorphOS / Emscripten) of Hydra Castle Labyrinth (a "metroidvania" kind of game). Status: Working."
PKG_TOOLCHAIN="cmake-make"

pre_configure_target() {
PKG_CMAKE_OPTS_TARGET=" -DUSE_SDL2=ON -DSDL2_INCLUDE_DIRS=$SYSROOT_PREFIX/usr/include/SDL2 -DSDL2_LIBRARIES=$SYSROOT_PREFIX/usr/lib"
LDFLAGS="$LDFLAGS -lSDL2"
}

makeinstall_target() {
mkdir -p $INSTALL/usr/bin
cp $PKG_BUILD/.${TARGET_NAME}/hcl $INSTALL/usr/bin

mkdir -p $INSTALL/usr/config/emuelec/configs/hcl/data
cp -r $PKG_BUILD/data/* $INSTALL/usr/config/emuelec/configs/hcl/data
}
