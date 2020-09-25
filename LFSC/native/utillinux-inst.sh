#!/bin/bash
set -e
make install-strip;
#fixing su
chmod u+rw /etc/shadow;
chmod g+r /etc/shadow;
chmod u+x /sbin/unix_chkpwd;
chmod g+s /sbin/unix_chkpwd;
chmod u+s /bin/su;
if ( [ $? = 0 ] ) ; then
  exit 0
fi
exit 1
