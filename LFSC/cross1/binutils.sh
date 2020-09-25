#!/bin/bash
set -e
../binutils-2.34/configure --prefix=/usr --with-system-zlib
# --enable-gold=yes test fail - incremental copy
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  #make check
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC tooldir=/usr install
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
