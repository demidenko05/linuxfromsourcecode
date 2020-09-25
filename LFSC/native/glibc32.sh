#!/bin/bash
set -e
#normal setting to install as the standard system library is --prefix=/usr - it will separate files to /lib and usr/lib according to FHS
#it always install into /lib and /usr/lib, according to HFS lib must have binaries of base architecture, but it can have link lib32/64
cat > configparms << "EOF"
slibdir=/lib32
libdir=/usr/lib32
EOF
if ( [ LFSC32B = 1 ] ) ; then
  ../glibc-2.31/configure --prefix=/usr --enable-kernel=5.5.0 --disable-profile --with-gnu-ld --enable-stack-protector=strong
else
  ../glibc-2.31/configure CC="gcc -m32" CXX="g++ -m32" --host=i686-linux-gnu --prefix=/usr --enable-kernel=5.5.0 \
  --includedir="/usr/include/i386-linux-gnu" --disable-profile --with-gnu-ld --enable-stack-protector=strong
fi
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    if ( [ $LFSCTEST = 1 ] ) ; then
      make check
    fi
    if ( [ $? = 0 ] ) ; then
      find . -type f -executable -exec strip --strip-debug '{}' \;
      if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
