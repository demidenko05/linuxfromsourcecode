#!/bin/bash
set -e
#make native gcc for Debian
../gcc-9.3.0/configure --prefix=/usr --enable-languages=c,c++ \
--with-multilib-list=m32,m64 --enable-multiarch  --program-suffix=-9 --program-prefix=x86_64-linux-gnu-
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  #make check
  if ( [ $? = 0 ] ) ; then
    #su -c "make install-strip-strip"
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
