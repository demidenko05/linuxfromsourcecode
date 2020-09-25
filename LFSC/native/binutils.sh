#!/bin/bash
set -e
../binutils-2.34/configure --prefix=/usr --with-system-zlib
# --enable-gold=yes test fail - incremental copy
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    if ( [ $LFSCTEST = 1 ] ) ; then
      make check
    fi
    if ( [ $? = 0 ] ) ; then
      if test "$(id -u)" = "0"; then make tooldir=/usr install; else su -c "make tooldir=/usr install"; fi
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
