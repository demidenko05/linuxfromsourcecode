#!/bin/bash
set -e
../gmp-6.2.0/configure --disable-static --prefix=/usr --enable-cxx --with-gnu-ld
#TODO --with-readline for demo-program
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make html
    if ( [ $? = 0 ] ) ; then
      if ( [ $LFSCTEST = 1 ] ) ; then
        make check
      fi
      if ( [ $? = 0 ] ) ; then
        su -c "make install-strip install-html"
        if ( [ $? = 0 ] ) ; then
          exit 0
        fi
      fi
    fi
  fi
fi
exit 1
