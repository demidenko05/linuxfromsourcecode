#!/bin/bash
# in ..src with unpacked sources!:
set -e
lfscgrflibprfx=/usr
lfscexprf=/usr/local
cd libpng-1.6.37
./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
make
if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
if ( [ $? = 0 ] ) ; then
#for cmake
  cd ../libuv-v1.34.2
  sh autogen.sh
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscexprf
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
#for llvm
  cd ../cmake-3.16.4
  ./configure --prefix=$lfscexprf
  make -j$NCORES
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../llvm-9.0.1.src
  bash $LFSC_HOME/LFSC/native/llvm.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../libjpeg-turbo-2.0.4
  mkdir -pv buildlfsc
  cd buildlfsc
  cmake -DCMAKE_INSTALL_PREFIX=$lfscgrflibprfx ..
  make
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../../freetype-2.10.1
  ./configure --sysconfdir=/etc --prefix=$lfscgrflibprfx
  make
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../giflib-5.2.1
  make
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make prefix=$lfscgrflibprfx install; else su -c "make prefix=$lfscgrflibprfx install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../jbigkit-2.1
  read -p " Add flag -fPIC to CFLAGS entry:
...
# Options for the compiler: A high optimization level is suggested
CFLAGS = -O2 -W -Wno-unused-result -fPIC
...
Do you understand? " lfsctrash
  nano Makefile
  make
  make test
  if test "$(id -u)" = "0"; then bash $LFSC_HOME/LFSC/native/jbigkit.sh; else su -c "bash $LFSC_HOME/LFSC/native/jbigkit.sh"; fi
fi
if ( [ $? = 0 ] ) ; then
#compression lib
  cd ../zstd-1.4.4/build/meson
  meson setup --prefix=$lfscgrflibprfx -Dbin_programs=true -Dbin_contrib=true buildlfsc
  cd buildlfsc
  ninja
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then ninja install; else su -c "ninja install"; fi
  #cd ../zstd-1.4.4
  #make all
  #make test
  #make man
  #if test "$(id -u)" = "0"; then bash $LFSC_HOME/LFSC/native/zstd.sh; else su -c "bash $LFSC_HOME/LFSC/native/zstd.sh"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../../../tiff-4.1.0
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
if ( [ $? = 0 ] ) ; then
  cd ../fontconfig-2.13.92
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscgrflibprfx
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#TODO xmlto xsttproc...
if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi

if ( [ $? = 0 ] ) ; then
  echo "Installing libs before X11 OK"
  exit 0
fi

echo "Something went wrong!"
exit 1
