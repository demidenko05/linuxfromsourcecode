#!/bin/bash
set -e
mkdir -pv buildlfsc
cd buildlfsc
#with enabled gallium ffplay throws error!
meson --prefix=/usr -Dplatforms="drm,x11" -Dgallium-drivers="" ..
if ( [ $? = 0 ] ) ; then
  ninja
  if ( [ $? = 0 ] ) ; then
    if ( [ $LFSCTEST = 1 ] ) ; then
      ninja test
    fi
    if ( [ $? = 0 ] ) ; then
      find . -type f -executable -exec strip --strip-debug '{}' \;
      if test "$(id -u)" = "0"; then ninja install; else su -c "ninja install"; fi
      exit 0
    fi
  fi
fi
exit 1
