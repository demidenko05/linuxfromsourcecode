#!/bin/bash
set -e
../bc-1.07.1/configure --disable-static --prefix=/usr --build=$LFSC_BUILD --host=$LFSC_HOST --with-readline
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    echo "quit" | ./bc/bc -l ../bc-1.07.1/Test/checklib.b
    if ( [ $? = 0 ] ) ; then
      if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
