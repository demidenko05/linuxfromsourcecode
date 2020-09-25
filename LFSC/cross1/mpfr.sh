#!/bin/bash
set -e
../mpfr-4.0.2/configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr --with-gnu-ld --with-sysroot=$LFSC
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make html
    #make check
    if ( [ $? = 0 ] ) ; then
      make DESTDIR=$LFSC install-strip install-html
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
