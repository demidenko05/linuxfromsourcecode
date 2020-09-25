#!/bin/bash
set -e
../make-4.3/configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr --with-gnu-ld
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
