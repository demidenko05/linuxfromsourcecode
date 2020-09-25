#!/bin/bash
# in ~/LFSC/src with unpacked sources!:
set -e
cd tcl8.6.10/unix
bash $LFSC_HOME/LFSC/native/tcl.sh
#TODO all doc-gens
if ( [ $? = 0 ] ) ; then
  #for shared-mime-info (GUI)
  cd ../../libxml2-2.9.9
  ./configure --disable-static --prefix=/usr
  make -j$NCORES
fi
if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
if ( [ $? = 0 ] ) ; then
  cd ../libxslt-1.1.34
  ./configure --disable-static --prefix=/usr
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../Path-Tiny-0.112
  perl Makefile.PL
  make
  make test
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../XML-XPath-1.44
  perl Makefile.PL
  make
  make test
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../itstool-2.0.6
  ./configure --disable-static --prefix=/usr
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../sgml-common-os2-0.6.3-os2
  autoreconf --install
  ./configure --disable-static --prefix=/usr
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../docbook-xml-4.5
  if test "$(id -u)" = "0"; then bash $LFSC_HOME/LFSC/native/docbookxml45.sh; else su -c "bash $LFSC_HOME/LFSC/native/docbookxml45.sh"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../docbook-xsl-nons-1.79.2
  if test "$(id -u)" = "0"; then bash $LFSC_HOME/LFSC/native/docbookxsl10.sh; else su -c "bash $LFSC_HOME/LFSC/native/docbookxsl10.sh"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../xmlto-0.0.28
  ./configure --disable-static --prefix=/usr
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../expect5.45.4
  bash $LFSC_HOME/LFSC/native/expect.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../dejagnu-1.6.2
  bash $LFSC_HOME/LFSC/native/dejagnu.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../check-0.14.0
  bash $LFSC_HOME/LFSC/native/check.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../blibpcre8
  cd ../blibpcre8
  bash $LFSC_HOME/LFSC/native/libpcre8.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../blibatomic_ops
  cd ../blibatomic_ops
  bash $LFSC_HOME/LFSC/native/libatomic_ops.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../blibunistring
  cd ../blibunistring
  bash $LFSC_HOME/LFSC/native/libunistring.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../blibgc
  cd ../blibgc
  bash $LFSC_HOME/LFSC/native/libgc.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bguile
  cd ../bguile
  bash $LFSC_HOME/LFSC/native/guile.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bautogen
  cd ../bautogen
  bash $LFSC_HOME/LFSC/native/autogen.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgcc
  cd ../bgcc
  bash $LFSC_HOME/LFSC/native/gcc.sh
fi
if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi
if ( [ $? = 0 ] ) ; then
  echo "Installing xml, docgen,testing, autogen, GCC OK, REBOOT!"
  exit 0
fi
echo "Something went wrong!"
exit 1
