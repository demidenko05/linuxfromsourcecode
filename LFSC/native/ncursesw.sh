#!/bin/bash
set -e
#TODO CPPFLAGS="-P $CPPFLAGS"
../ncurses-6.2/configure CPPFLAGS="-P $CPPFLAGS" --prefix=/usr --with-shared --with-termlib --with-gnu-ld \
--enable-widec --enable-pc-files --with-pkg-config-libdir=/usr/lib/pkgconfig
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    find . -type f -executable -exec strip --strip-debug '{}' \;
    if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
