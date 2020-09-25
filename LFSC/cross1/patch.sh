#!/bin/bash
set -e
../patch-2.7.6/configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr
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
