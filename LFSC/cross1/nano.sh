#!/bin/bash
#d.run: ncurses
set -e
../nano-4.8/configure --disable-static --prefix= --build=$LFSC_BUILD --host=$LFSC_HOST --includedir=/usr/include \
--datarootdir=/usr/share --libexecdir=/usr/libexec --with-gnu-ld
# --enable-tiny
if ( [ $? = 0 ] ) ; then
  make LDFLAGS="-ltinfow $LDFLAGS" -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
