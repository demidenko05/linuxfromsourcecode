#!/bin/bash
set -e
../dbus-1.13.12/configure --disable-static --prefix=/usr --with-gnu-ld \
--with-console-auth-dir=/run/console --with-system-pid-file=/run/dbus/pid \
--with-system-socket=/run/dbus/system_bus_socket
# --sysconfdir=/etc
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    make install-strip
    if ( [ $? = 0 ] ) ; then
      exit 0
    fi
  fi
fi
exit 1
