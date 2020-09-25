#!/bin/bash
set -e
./configure --disable-static --prefix= --build=$LFSC_BUILD --host=$LFSC_HOST --with-sysroot=$LFSC --with-gnu-ld \
--includedir=/usr/include --datarootdir=/usr/share --libexecdir=/usr/libexec
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    find . -type f -executable -exec strip --strip-debug '{}' \;
    make DESTDIR=$LFSC install
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
