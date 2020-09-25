#!/bin/bash
#as root:
#change to LFSC destination:
set -e
LFSC_HOME=/home/!!![psth]
LFSC=$LFSC_HOME/lfsc
if ( [ $? = 0 ] ) ; then
  dpkg --add-architecture i386
  apt-get install patch gcc g++ make gawk automake libtool lzip
  apt-get install gcc-multilib g++-multilib
  #android:
  apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 libbz2-1.0:i386
  apt-get install gettext gperf intltool pkg-config xsltproc docbook2x groff docbook-xsl
  #!optional for dbus spec:
  #apt-get install xmlto
  #without desktop mouse select/copy: apt-get install gpm
  #for kernel:
  apt-get install bc libbison-dev libncurses5-dev flex libelf-dev libssl-dev
  #native gcc
  #apt-get install libgmp-dev libmpfr-dev libmpc-dev
  exit 0
fi
exit 1
