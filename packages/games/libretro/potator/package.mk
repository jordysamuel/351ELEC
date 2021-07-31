PKG_NAME="potator"
PKG_VERSION="44a14b0212b9069f0d2648019cd1368447cb7452"
PKG_SHA256="c331f5473b6e3c7b0d32fdae223332fcac8b5031233fdbe55cf272f8fde8f7e0"
PKG_REV="1"
PKG_ARCH="any"
PKG_LICENSE="GPLv2"
PKG_SITE="https://github.com/libretro/potator"
PKG_URL="$PKG_SITE/archive/$PKG_VERSION.tar.gz"
PKG_DEPENDS_TARGET="toolchain"
PKG_PRIORITY="optional"
PKG_SECTION="libretro"
PKG_SHORTDESC="A Watara Supervision Emulator based on Normmatt version."
PKG_LONGDESC="A Watara Supervision Emulator based on Normmatt version."
PKG_TOOLCHAIN="make"


make_target() {
  make -C platform/libretro/ platform=aarch64
}

makeinstall_target() {
  mkdir -p $INSTALL/usr/lib/libretro
  cp platform/libretro/potator_libretro.so $INSTALL/usr/lib/libretro/
}
