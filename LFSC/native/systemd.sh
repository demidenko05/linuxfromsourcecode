#!/bin/bash
#d.run: libcap util-linux dbus lz-utils
set -e
mkdir -pv buildlfsc
cd buildlfsc
meson --prefix=/usr
if ( [ $? = 0 ] ) ; then
  ninja
  if ( [ $LFSCTEST = 1 ] ) ; then
    ninja test
  fi
  if ( [ $? = 0 ] ) ; then
    find . -type f -executable -exec strip --strip-debug '{}' \;
    if test "$(id -u)" = "0"; then ninja install; else su -c "ninja install"; fi
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
