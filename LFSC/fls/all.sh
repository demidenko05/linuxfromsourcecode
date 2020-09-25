#!/bin/bash
set -e
bash $LFSC_HOME/LFSC/fls/fstab.sh
if ( [ $? = 0 ] ) ; then
  #bash $LFSC_HOME/LFSC/fls/nsswitch.sh
  bash $LFSC_HOME/LFSC/fls/profile.sh
  bash $LFSC_HOME/LFSC/fls/host.sh
  cp $LFSC_HOME/LFSC/fls/ld.so.conf $LFSC/etc
  cp -r $LFSC_HOME/LFSC/fls/ld.so.conf.d $LFSC/etc
  cp -r $LFSC_HOME/LFSC/fls/pam.d $LFSC/etc
  cp $LFSC_HOME/LFSC/fls/addbs.txt $LFSC/usr/doc
fi
