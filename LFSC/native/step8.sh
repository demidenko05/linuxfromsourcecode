#!/bin/bash
# in ..src with unpacked sources!:
set -e
lfscgrflibprfx=/usr
cd glib-2.63.5
mkdir -pv buildlfsc
cd buildlfsc
meson --prefix=$lfscgrflibprfx ..
ninja
#ninja test
find . -type f -executable -exec strip --strip-debug '{}' \;
if test "$(id -u)" = "0"; then ninja install; else su -c "ninja install"; fi
#for polkit0.105
if test "$(id -u)" = "0"; then ln -sv gio-unix-2.0/gio $lfscgrflibprfx/include/gio; else su -c "ln -sv gio-unix-2.0/gio $lfscgrflibprfx/include/gio"; fi
if ( [ $? = 0 ] ) ; then
  cd ../../cairo-1.16.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../harfbuzz-2.6.3
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#reinstall cause cross-mutual deps
if ( [ $? = 0 ] ) ; then
  cd ../freetype-2.10.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../fontconfig-2.13.92
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../fribidi-1.0.8
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../pango-1.44.7
  mkdir -pv buildlfsc
  cd buildlfsc
  meson --prefix=$lfscgrflibprfx -Dintrospection=false ..
  ninja
  #ninja test
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then ninja install; else su -c "ninja install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../../atk-2.35.1
  mkdir -pv buildlfsc
  cd buildlfsc
  meson --prefix=$lfscgrflibprfx -Dintrospection=false ..
  ninja
  #ninja test
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then ninja install; else su -c "ninja install"; fi
fi
if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi
if ( [ $? = 0 ] ) ; then
  cd ../../shared-mime-info-1.15
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../hicolor-icon-theme-0.17
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../gdk-pixbuf-2.38.2
  mkdir -pv buildlfsc
  cd buildlfsc
  meson --prefix=$lfscgrflibprfx -Dgir=false ..
  ninja
  find . -type f -executable -exec strip --strip-debug '{}' \;
  #ninja test
  set +e
  if test "$(id -u)" = "0"; then ninja install; else su -c "ninja install"; fi
  if ( [ $? != 0 ] ) ; then
    #/usr/local/lib/gdk_pixbuf.so non registered
    if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi
    set -e
    if test "$(id -u)" = "0"; then ninja install; else su -c "ninja install"; fi
  else
    set -e
  fi
fi
if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi
if ( [ $? = 0 ] ) ; then
  cd ../../gtk+-2.24.32
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libcroco-0.6.13
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../jasper-2.0.14
  mkdir -pv buildlfsc
  cd buildlfsc
  cmake -DCMAKE_INSTALL_PREFIX=$lfscgrflibprfx ..
  make -j$NCORES clean all
  make test
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../../imlib2-1.6.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../gtk-engines-2.20.2
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../keybinder-0.3.1
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx --with-gnu-ld --disable-python
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libglade-2.6.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libxklavier-5.4
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../startup-notification-0.12
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../openjpeg-2.3.1
  mkdir -pv buildlfsc
  cd buildlfsc
  cmake -DCMAKE_INSTALL_PREFIX=$lfscgrflibprfx ..
  make
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
#TODO spell
if ( [ $? = 0 ] ) ; then
  cd ../../aspell-0.60.8
  ./configure --sysconfdir=/etc --disable-static --prefix=/usr
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../hunspell-1.7.0
  ./configure --sysconfdir=/etc --disable-static --prefix=/usr
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../enchant-2.2.8
  ./configure --sysconfdir=/etc --disable-static --prefix=/usr
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../librsvg-2.40.21
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx --disable-introspection
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../slang-2.3.2
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../mc-4.8.23
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi

#reinstalling:
if ( [ $? = 0 ] ) ; then
  cd ../tiff-4.1.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libwebp-1.1.0
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx --enable-libwebpmux --enable-libwebpdemux \
--enable-libwebpdecoder --enable-libwebpextras --enable-swap-16bit-csp
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi

if ( [ $? = 0 ] ) ; then
  echo "Installing libs after X11 OK"
  exit 0
fi

echo "Something went wrong!"
exit 1
