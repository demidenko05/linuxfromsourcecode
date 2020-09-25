#!/bin/bash
set -e
if ( [ $LFSC32B = 1 ] ) ; then
  ../glibc-2.31/configure CC="gcc" CXX="g++" --prefix=/usr --host=x86_64-linux-gnu --includedir="/usr/include/x86_64-linux-gnu" \
  --enable-kernel=5.5.0 --disable-profile --with-gnu-ld --enable-stack-protector=strong
else
  ../glibc-2.31/configure --prefix=/usr --enable-kernel=5.5.0 --disable-profile --with-gnu-ld --enable-stack-protector=strong
fi
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    if ( [ $LFSCTEST = 1 ] ) ; then
      make check
    fi
    if ( [ $? = 0 ] ) ; then
      set +e
      find . -type f -executable -exec strip --strip-debug '{}' \;
      if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
      if ( [ $? = 0 ] ) ; then
        exit 0
      else
        set -e
  read -p " add conditions to disable libs [lib_test2, nsl, nss_nis, nss_nisplus] in scripts/test-installation.pl (find F6 nss_test1):
...
&& $name ne \"nss_test1\" && $name ne \"nss_test2\" && $name ne \"nsl\" && $name ne \"nss_nis\" && $name ne \"nss_nisplus\" 
...
Do you understand? " lfsctrash
        nano ../glibc-2.31/scripts/test-installation.pl
        if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
        if ( [ $? = 0 ] ) ; then
          exit 0
        fi
      fi
    fi
  fi
fi
exit 1
