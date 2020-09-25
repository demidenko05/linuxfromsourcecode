#!/bin/bash
set -e
make
if ( [ $? = 0 ] ) ; then
  find . -type f -executable -exec strip --strip-debug '{}' \;
  make PREFIX=$LFSC/usr install
  if ( [ $? = 0 ] ) ; then
    make clean 
    make -f Makefile-libbz2_so
    if ( [ $? = 0 ] ) ; then
      install -vm755 libbz2.so.1.0.8 $LFSC/usr/lib
      ln -svf libbz2.so.1.0.8 $LFSC/usr/lib/libbz2.so.1.0
      ln -svf libbz2.so.1.0 $LFSC/usr/lib/libbz2.so
      exit 0
    fi
  fi
fi
exit 1
