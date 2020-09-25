#!/bin/bash
set -e
../automake-1.16.1/configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr
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
