#!/bin/bash
set -e
../gcc-9.3.0/configure --prefix=/usr --with-sysroot=/ --build=$LFSC_BUILD --host=$LFSC_HOST --target=$LFSC_HOST \
--enable-languages=c,c++  --libdir=/usr/lib --enable-nls \
--with-system-zlib --with-target-system-zlib --enable-multiarch \
--with-multilib-list=m32,m64 --enable-multilib
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make DESTDIR=$LFSC install-strip
    if ( [ $? = 0 ] ) ; then
      #for Perl
      ln -svf gcc $LFSC/usr/bin/cc
      exit 0
    fi
  fi
fi
exit 1
