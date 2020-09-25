#!/bin/bash
set -e
mkdir -pv bgccn
cd bgccn
bash $LFSC_HOME/LFSC/cross1/gcc-native.sh
if ( [ $? = 0 ] ) ; then
  exit 0
fi
exit 1
