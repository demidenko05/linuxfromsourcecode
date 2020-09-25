#!/bin/bash
set -e
../gcc-9.3.0/configure --prefix=/usr --enable-languages=c,c++ --with-system-zlib \
--with-multilib-list=m32,m64 --enable-multiarch --disable-manpages --disable-docs
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
