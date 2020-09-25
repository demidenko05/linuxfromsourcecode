#!/bin/bash
set -e
./configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr --with-gnu-ld
#
exit 0

if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
