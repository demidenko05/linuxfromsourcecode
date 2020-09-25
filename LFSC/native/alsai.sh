#!/bin/bash
set -e
make install-strip;
/sbin/ldconfig
/usr/local/sbin/alsactl init
/usr/local/sbin/alsactl store
if ( [ $? = 0 ] ) ; then
  exit 0
fi
exit 1
