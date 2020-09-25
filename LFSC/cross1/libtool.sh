#!/bin/bash
set -e
../libtool-2.4.6/configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr --with-gnu-ld --with-sysroot=$LFSC
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  #make check
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
