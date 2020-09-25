#!/bin/bash
set -e
../kmod-27/configure --disable-static --prefix=/usr --build=$LFSC_BUILD --host=$LFSC_HOST --with-sysroot=$LFSC \
--with-gnu-ld --with-xz --with-zlib
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      for kmodpr in lsmod depmod insmod modinfo modprobe rmmod; do
          ln -sfv ../usr/bin/kmod $LFSC/sbin/$kmodpr
      done
      exit 0
    fi
  fi
fi
exit 1
