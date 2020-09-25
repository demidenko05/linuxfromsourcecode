#!/bin/bash
#d.run: libpipeline
set -e
../gdbm-1.18/configure --disable-static --prefix=/usr --with-gnu-ld
# --enable-libgdbm-compat
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    if ( [ $LFSCTEST = 1 ] ) ; then
      make check
      #TODO fail without reasons
    fi
    if ( [ $? = 0 ] ) ; then
      if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
