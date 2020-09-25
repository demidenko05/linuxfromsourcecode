#!/bin/bash
set -e
../m4-1.4.18/configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr --with-gnu-ld --without-included-regex
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    #make check
    if ( [ $? = 0 ] ) ; then
      make DESTDIR=$LFSC install-strip
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
