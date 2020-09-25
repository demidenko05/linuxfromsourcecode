#!/bin/bash
# in ..src with unpacked sources!:
set -e
cd libcap-2.33
bash $LFSC_HOME/LFSC/native/libcap.sh
if ( [ $? = 0 ] ) ; then
  cd ../yasm-1.3.0
  ./configure --disable-static --prefix=/usr
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../wireless-tools-29/wireless_tools
  make -j$NCORES
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make PREFIX=/usr INSTALL_MAN=/usr/share/man install; else su -c "make PREFIX=/usr INSTALL_MAN=/usr/share/man install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../../nasm-2.14.02
  ./configure --disable-static --prefix=/usr
  make -j$NCORES
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
#readline strip and static error
  cd ../gdb-8.3
  ./configure --prefix=/usr
  make -j$NCORES
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../iso-codes-last
  ./configure --prefix=/usr
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../icu/source
  ./configure --disable-static --prefix=/usr
  make -j$NCORES
  make check
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
#curl...elfutils for kernel
if ( [ $? = 0 ] ) ; then
  cd ../../curl-7.68.0
  ./configure --disable-static --prefix=/usr
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libmicrohttpd-0.9.70
  ./configure --disable-static --prefix=/usr --sysconfdir=/etc
  make -j$NCORES
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libarchive-3.4.2
  ./configure --disable-static --prefix=/usr --sysconfdir=/etc
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../sqlite-autoconf-3310100
  ./configure --disable-static --prefix=/usr --sysconfdir=/etc
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../elfutils-0.178
  ./configure --disable-static --prefix=/usr --sysconfdir=/etc
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
#requires curl
  cd ../git-2.25.1
  make prefix=/usr
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make prefix=/usr install; else su -c "make prefix=/usr install"; fi
  #asciidoc TODO install-doc install-html install-info
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgrub
  cd ../bgrub
  bash $LFSC_HOME/LFSC/native/grub.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bncursesw
  cd ../bncursesw
  bash $LFSC_HOME/LFSC/native/ncursesw.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../attr-2.4.48
  bash $LFSC_HOME/LFSC/native/attr.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../acl-2.2.53
  bash $LFSC_HOME/LFSC/native/acl.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../lzip-1.21
  ./configure --disable-static --prefix=/usr --sysconfdir=/etc
  make
  make check
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../bzip2-1.0.8
  read -p " Comment in Makefile these entries:
...
#CC=gcc
#AR=ar
#RANLIB=ranlib
#LDFLAGS=

BIGFILES=-D_FILE_OFFSET_BITS=64
...
Do you understand? " lfsctrash
  nano Makefile
  read -p " Comment in Makefile-libbz2_so CC entry:
...
SHELL=/bin/sh
#CC=gcc
BIGFILES=-D_FILE_OFFSET_BITS=64
...
Do you understand? " lfsctrash
  nano Makefile-libbz2_so
  bash $LFSC_HOME/LFSC/native/bzip2.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgzip
  cd ../bgzip
  bash $LFSC_HOME/LFSC/native/gzip.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bxzutils
  cd ../bxzutils
  bash $LFSC_HOME/LFSC/native/xzutils.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../btar
  cd ../btar
  bash $LFSC_HOME/LFSC/native/tar.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bsed
  cd ../bsed
  bash $LFSC_HOME/LFSC/native/sed.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bkbd
  cd ../bkbd
  bash $LFSC_HOME/LFSC/native/kbd.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bkmod
  cd ../bkmod
  bash $LFSC_HOME/LFSC/native/kmod.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bflex
  cd ../bflex
  bash $LFSC_HOME/LFSC/native/flex.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bbison
  cd ../bbison
  bash $LFSC_HOME/LFSC/native/bison.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../expat-2.2.9
  bash $LFSC_HOME/LFSC/native/expat.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../breadline
  cd ../breadline
  bash $LFSC_HOME/LFSC/native/readline.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgdbm
  cd ../bgdbm
  bash $LFSC_HOME/LFSC/native/gdbm.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../blibpipeline
  cd ../blibpipeline
  bash $LFSC_HOME/LFSC/native/libpipeline.sh
fi
if ( [ $? = 0 ] ) ; then
  cp $LFSC_HOME/LFSC/fls/fix-libmath_h ../bc-1.07.1/bc
  mkdir -pv ../bbc
  cd ../bbc
  bash $LFSC_HOME/LFSC/native/bc.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../procps-ng-3.3.15
  bash $LFSC_HOME/LFSC/native/procps.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../psmisc-23.3
  bash $LFSC_HOME/LFSC/native/psmisc.sh
fi
if ( [ $? = 0 ] ) ; then
  #it broke su in case of "non-root installing", fixing see inside
  mkdir -pv ../butillinux
  cd ../butillinux
  bash $LFSC_HOME/LFSC/native/utillinux.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../be2fsprogs
  cd ../be2fsprogs
  bash $LFSC_HOME/LFSC/native/e2fsprogs.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bcoreutils
  cd ../bcoreutils
  bash $LFSC_HOME/LFSC/native/coreutils.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bdiffutils
  cd ../bdiffutils
  bash $LFSC_HOME/LFSC/native/diffutils.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgrep
  cd ../bgrep
  bash $LFSC_HOME/LFSC/native/grep.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bfindutils
  cd ../bfindutils
  bash $LFSC_HOME/LFSC/native/findutils.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../btexinfo
  cd ../btexinfo
  bash $LFSC_HOME/LFSC/native/texinfo.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bless
  cd ../bless
  bash $LFSC_HOME/LFSC/native/less.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bm4
  cd ../bm4
  bash $LFSC_HOME/LFSC/native/m4.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgawk
  cd ../bgawk
  bash $LFSC_HOME/LFSC/native/gawk.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgettext
  cd ../bgettext
  bash $LFSC_HOME/LFSC/native/gettext.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../gperf
  cd ../gperf
  bash $LFSC_HOME/LFSC/native/gperf.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bmake
  cd ../bmake
  bash $LFSC_HOME/LFSC/native/make.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bpatch
  cd ../bpatch
  bash $LFSC_HOME/LFSC/native/patch.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../blibtool
  cd ../blibtool
  bash $LFSC_HOME/LFSC/native/libtool.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bautoconf
  cd ../bautoconf
  bash $LFSC_HOME/LFSC/native/autoconf.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bautomake
  cd ../bautomake
  bash $LFSC_HOME/LFSC/native/automake.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bnano
  cd ../bnano
  bash $LFSC_HOME/LFSC/native/nano.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bbash
  cd ../bbash
  bash $LFSC_HOME/LFSC/native/bash.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bpkgconfig
  cd ../bpkgconfig
  bash $LFSC_HOME/LFSC/native/pkgconfig.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bfile
  cd ../bfile
  bash $LFSC_HOME/LFSC/native/file.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../perl-5.30.1
  bash $LFSC_HOME/LFSC/native/perl.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgroff
  cd ../bgroff
  bash $LFSC_HOME/LFSC/native/groff.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../blibffi
  cd ../blibffi
  bash $LFSC_HOME/LFSC/native/libffi.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bpython3
  cd ../bpython3
  bash $LFSC_HOME/LFSC/native/python3.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../XML-Parser-2.46
  bash $LFSC_HOME/LFSC/native/xmpparser.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bintltool
  cd ../bintltool
  bash $LFSC_HOME/LFSC/native/intltool.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bopenssl
  cd ../bopenssl
  bash $LFSC_HOME/LFSC/native/openssl.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../libusb-1.0.23
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../usbutils-012
  sh autogen.sh
  ./configure --prefix=/usr --sysconfdir=/etc --disable-static
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../pciutils-3.6.4
  make PREFIX=/usr ZLIB=no
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make PREFIX=/usr ZLIB=no install install-lib; else su -c "make PREFIX=/usr ZLIB=no install install-lib"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../systemd-244
  bash $LFSC_HOME/LFSC/native/systemd.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bdbus
  cd ../bdbus
  bash $LFSC_HOME/LFSC/native/dbus.sh
fi
#TODO GLIB, MC here!!!
if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi
if ( [ $? = 0 ] ) ; then
  echo "(Re)installing the part1 with tests OK"
  exit 0
fi
echo "Something went wrong!"
exit 1
