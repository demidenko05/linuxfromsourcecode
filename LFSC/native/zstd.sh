#!/bin/bash
set -e
make PRGDIR=/usr/bin ZSTDDIR=/usr/lib install
install -d /usr/man/man1
install -vm644 pbmtools/*.1 /usr/man/man1
install -d /usr/man/man5
install -vm644 pbmtools/*.5 /usr/man/man5
if ( [ $? = 0 ] ) ; then
  exit 0
fi
exit 1
