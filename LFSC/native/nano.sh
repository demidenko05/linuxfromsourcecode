#!/bin/bash
#d.run: ncurses
set -e
../nano-4.8/configure --disable-static --prefix= --includedir=/usr/include \
--datarootdir=/usr/share --libexecdir=/usr/libexec --with-gnu-ld
if ( [ $? = 0 ] ) ; then
  #TODO outdated?LDFLAGS="-ltinfow $LDFLAGS"
  make LDFLAGS="-ltinfow $LDFLAGS" -j$NCORES
  if ( [ $LFSCTEST = 1 ] ) ; then
    make check
  fi
  if ( [ $? = 0 ] ) ; then
    if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
