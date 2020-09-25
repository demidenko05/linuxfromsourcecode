#!/bin/bash
set -e
./configure --disable-static --prefix=/usr
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    #strip /usr/bin/_ins.16127_ wrong format
    find . -type f -executable -exec strip --strip-debug '{}' \;
    su -c "make install install-private-headers"
    if ( [ $? = 0 ] ) ; then
      su -c "ln -sv tclsh8.6 /usr/bin/tclsh"
      exit 0
    fi
  fi
fi
exit 1
