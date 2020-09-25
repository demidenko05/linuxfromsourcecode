#!/bin/bash
set -e
../gettext-0.20/configure --disable-static --prefix=/usr --with-gnu-ld \
--with-sysroot=$LFSC --without-included-regex
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
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
