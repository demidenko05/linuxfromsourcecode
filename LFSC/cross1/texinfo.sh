#!/bin/bash
set -e
../texinfo-6.7/configure --disable-static --prefix=/usr --build=$LFSC_BUILD --host=$LFSC_HOST --with-sysroot=$LFSC --with-gnu-ld --enable-pc-files
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      make TEXMF=$LFSC/usr/share install-tex
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
