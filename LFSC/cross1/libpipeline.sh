#!/bin/bash
set -e
../libpipeline-1.5.2/configure --disable-static --prefix=/usr --build=$LFSC_BUILD --host=$LFSC_HOST --with-sysroot=$LFSC --with-gnu-ld
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
