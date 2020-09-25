#!/bin/bash
set -e
make install-strip;
#TODO /etc/dbus-1:
cp /etc/dbus-1/system.d/org.freedesktop.PolicyKit1.conf /usr/share/dbus-1/system.d
install -cvm644 ../../../fls/systemd/polkit.service /lib/systemd/system
if ( [ $? = 0 ] ) ; then
 exit 0
fi
exit 1
