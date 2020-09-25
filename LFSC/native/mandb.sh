#!/bin/bash
#d.run: libpipeline gdbm groff less ?gawk?
set -e
../man-db-2.7.6.1/configure --disable-static --prefix=/usr --with-gnu-ld --without-included-regex --disable-setuid
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $LFSCTEST = 1 ] ) ; then
    make check
  fi
  ./src/man -l man/man5/manpath.5
  if ( [ $? = 0 ] ) ; then
    if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
