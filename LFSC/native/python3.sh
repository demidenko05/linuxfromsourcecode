#!/bin/bash
set -e
../Python-3.8.1/configure --disable-static --prefix=/usr --with-system-ffi
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    if ( [ $LFSCTEST = 1 ] ) ; then
      make test
    fi
    if ( [ $? = 0 ] ) ; then
      find . -type f -executable -exec strip --strip-debug '{}' \;
      if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
      if test "$(id -u)" = "0"; then ln -svf python3 /usr/bin/python; else su -c "ln -svf python3 /usr/bin/python"; fi
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
