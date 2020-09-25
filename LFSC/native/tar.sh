#!/bin/bash
set -e
if test "$(id -u)" = "0"; then
 lfscadd="FORCE_UNSAFE_CONFIGURE=1";
fi
../tar-1.32/configure --disable-static --prefix=/usr --with-gnu-ld --without-included-regex $lfscadd
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
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
fi
exit 1
