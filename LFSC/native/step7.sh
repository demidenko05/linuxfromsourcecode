#!/bin/bash
# in ..src with unpacked sources!:
set -e
#prefix /usr/local leads to broke bash - it stops to understand bulk wildcard commands like "rm /usr/lib/*.la", and it's never related to shopt dotglob (off always)
#and gtk2/demo fails on test-inline-pixbufs.h Makefile:1016
#cause they duplicate locales 
lfscxprefix=/usr
lfscgrflibprfx=/usr
cd xorg-sgml-doctools-1.11
./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
make
if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
if ( [ $? = 0 ] ) ; then
  cd ../xorg-docs-1.7.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../util-macros-1.19.2
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xorgproto-2019.2
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXdmcp-1.1.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXau-1.0.9
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xcb-proto-1.13
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libpthread-stubs-0.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libxcb-1.13.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xtrans-1.4.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libX11-1.6.9
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../pixman-0.38.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libpciaccess-0.16
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
#https://dri.freedesktop.org/libdrm/libdrm-2.4.100.tar.gz.sig
  cd ../libdrm-2.4.100
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libxshmfence-1.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#if ( [ $? = 0 ] ) ; then
  #cd ../kbproto-1.14
  #./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  #if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
#fi
if ( [ $? = 0 ] ) ; then
  cd ../libxkbfile-1.1.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libfontenc-1.1.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#if ( [ $? = 0 ] ) ; then
  #cd ../xextproto-7.3.0
  #./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  #if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
#fi
if ( [ $? = 0 ] ) ; then
  cd ../libXext-1.3.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#if ( [ $? = 0 ] ) ; then
  #cd ../dmxproto-2.3.1
  #./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  #if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
#fi
if ( [ $? = 0 ] ) ; then
  cd ../libdmx-1.1.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXxf86vm-1.1.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xf86miscproto-0.9.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXxf86misc-1.0.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#if ( [ $? = 0 ] ) ; then
  #cd ../xf86dgaproto-2.1
  #./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  #if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
#fi
if ( [ $? = 0 ] ) ; then
  cd ../libXxf86dga-1.1.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#if ( [ $? = 0 ] ) ; then
  #cd ../videoproto-2.3.3
  #./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  #if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
#fi
if ( [ $? = 0 ] ) ; then
  cd ../libXv-1.0.11
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXvMC-1.0.12
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#if ( [ $? = 0 ] ) ; then
  #cd ../inputproto-2.3.2
  #./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  #if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
#fi
#if ( [ $? = 0 ] ) ; then
  #cd ../recordproto-1.14.2
  #./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  #if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
#fi
#if ( [ $? = 0 ] ) ; then
  #cd ../fixesproto-5.0
  #./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  #if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
#fi
if ( [ $? = 0 ] ) ; then
  cd ../libXfixes-5.0.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXi-1.7.10
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXtst-1.2.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libICE-1.0.10
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libSM-1.2.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXt-1.2.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXres-1.2.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXrender-0.9.10
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXrandr-1.5.2
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXpm-3.5.13
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXau-1.0.9
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../printproto-1.0.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXp-1.0.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXmu-1.1.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXinerama-1.1.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXft-2.3.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXfont2-2.0.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#if ( [ $? = 0 ] ) ; then
  #cd ../damageproto-1.2.1
  #./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  #if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
#fi
if ( [ $? = 0 ] ) ; then
  cd ../libXdamage-1.1.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXcursor-1.2.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#if ( [ $? = 0 ] ) ; then
  #cd ../compositeproto-0.4.2
  #./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  #if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
#fi
if ( [ $? = 0 ] ) ; then
  cd ../libXcomposite-0.4.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXaw-1.0.13
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libXaw3d-1.6.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#if ( [ $? = 0 ] ) ; then
  #cd ../scrnsaverproto-1.2.2
  #./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  #if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
#fi
if ( [ $? = 0 ] ) ; then
  cd ../libXScrnSaver-1.2.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libSM-1.2.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libFS-1.0.8
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xcb-util-0.4.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xcb-util-renderutil-0.3.9
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xcb-util-image-0.4.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xcb-util-cursor-0.1.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xcb-util-errors-1.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xcb-util-keysyms-0.4.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xcb-util-wm-0.4.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
#non-x
  cd ../mesa-20.0.0
  bash $LFSC_HOME/LFSC/native/mesa.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../xbitmaps-1.1.2
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../glu-9.0.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../freeglut-3.2.1
  mkdir -pv buildlfsc
  cd buildlfsc
  cmake -DCMAKE_INSTALL_PREFIX=$lfscgrflibprfx -DCMAKE_BUILD_TYPE=Release \
-DFREEGLUT_BUILD_DEMOS=OFF -DFREEGLUT_BUILD_STATIC_LIBS=OFF ..
  make -j$NCORES
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../../xwud-1.0.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xwininfo-1.1.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xwd-1.0.7
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xvinfo-1.1.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xstdcmap-1.0.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xsetroot-1.1.2
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xset-1.2.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xrefresh-1.0.6
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xrdb-1.2.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xrandr-1.5.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xprop-1.2.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xpr-1.0.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xmore-1.0.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xmodmap-1.0.10
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xmessage-1.0.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xman-1.1.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xlsfonts-1.0.6
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xlsclients-1.1.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xlsatoms-1.1.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xlogo-1.0.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xload-1.1.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xkill-1.0.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xkbutils-1.0.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xkbprint-1.0.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xkbevd-1.1.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xkbcomp-1.4.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xinput-1.6.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xinit-1.4.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xhost-1.0.8
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xgamma-1.0.6
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xfontsel-1.0.6
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xfd-1.1.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xev-1.2.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xdriinfo-1.0.6
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xdpyinfo-1.3.2
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xcursorgen-1.0.7
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xcmsdb-1.0.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xbacklight-1.2.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xauth-1.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../x11perf-1.6.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../smproxy-1.0.6
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../setxkbmap-1.3.2
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../sessreg-1.1.2
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../mkfontscale-1.2.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../mkfontdir-1.0.7
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../mkfontdir-1.0.7
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../luit-20190106
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../iceauth-1.0.8
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../bitmap-1.0.9
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../bdftopcf-1.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../appres-1.0.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi
if ( [ $? = 0 ] ) ; then
  cd ../xcursor-themes-1.0.6
  ./configure --sysconfdir=/etc --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xkeyboard-config-2.28
  ./configure --sysconfdir=/etc --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../font-util-1.3.2
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../encodings-1.0.5
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../font-alias-1.0.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../font-adobe-utopia-type1-1.0.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../font-bh-ttf-1.0.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../font-bh-type1-1.0.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../font-misc-cyrillic-1.0.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../font-xfree86-type1-1.0.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
#non-x
  cd ../libepoxy-1.5.4
 # read -p " Make in Makefile this entry:...ACLOCAL_AMFLAGS = -I m4 -I /usr/local/share/aclocal...Do you understand? " lfsctrash
#  nano Makefile.am
  sh autogen.sh
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xorg-server-1.20.7
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libevdev-1.8.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../mtdev-1.1.6
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xf86-input-evdev-2.10.6
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libinput-1.15.2
  mkdir -pv buildlfsc
  cd buildlfsc
  meson --prefix=$lfscgrflibprfx -Dlibwacom=false -Ddocumentation=false -Ddebug-gui=false -Dtests=false ..
  ninja
  #ninja test
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then ninja install; else su -c "ninja install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../../xf86-input-libinput-0.29.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xf86-input-synaptics-1.9.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xf86-video-fbdev-0.5.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xf86-video-intel-last
  sh autogen.sh
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ -e ../xf86-video-nouveau-1.0.16 ] ) ; then
  cd ../xf86-video-nouveau-1.0.16
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscxprefix
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi
if ( [ $? = 0 ] ) ; then
  echo "Installing X11 OK"
  exit 0
fi

echo "Something went wrong!"
exit 1
