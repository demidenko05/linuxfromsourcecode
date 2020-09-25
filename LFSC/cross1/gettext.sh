#!/bin/bash
set -e
../gettext-0.20/configure --build=$LFSC_BUILD --host=$LFSC_HOST --prefix=/usr --with-gnu-ld \
--with-sysroot=$LFSC --without-included-regex
if ( [ $? = 0 ] ) ; then
  #there was a failure?
  make V=1
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
