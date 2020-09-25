#!/bin/bash
#unpack LFSC[VERSION].tar.xz in LFSC_HOME (e.g. your home) ...
set -e
bash $LFSC_HOME/LFSC/fls/mkdirs.sh
if ( [ $? = 0 ] ) ; then
  exit 0
fi
exit 1
