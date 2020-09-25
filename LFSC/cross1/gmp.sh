#!/bin/bash
set -e
../gmp-6.2.0/configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr --enable-cxx --with-gnu-ld --with-sysroot=$LFSC
#TODO --with-readline for demo-program
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  #make check
  if ( [ $? = 0 ] ) ; then
    make html
    if ( [ $? = 0 ] ) ; then
      make DESTDIR=$LFSC install-strip install-html
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
