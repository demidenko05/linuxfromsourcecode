#!/bin/bash
set -e
../dbus-1.13.12/configure --disable-static --prefix=/usr --with-gnu-ld --enable-user-session --enable-systemd \
--with-console-auth-dir=/run/console --with-system-pid-file=/run/dbus/pid \
--with-system-socket=/run/dbus/system_bus_socket
# --sysconfdir=/etc
if ( [ $? = 0 ] ) ; then
  make -j$NCORES
  if ( [ $? = 0 ] ) ; then
    if ( [ $LFSCTEST = 1 ] ) ; then
      make check
    fi
    if ( [ $? = 0 ] ) ; then
      if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
      if ( [ $? = 0 ] ) ; then
        exit 0
      fi
    fi
  fi
fi
exit 1
