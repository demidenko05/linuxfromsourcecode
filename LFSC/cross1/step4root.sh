#!/bin/bash
#as root:
#make and choose disk partition:
set -e
LFSC_SDA=!!![sda2]
LFSC_HOME=/home/!!![your name]or$LFSC_SDA
LFSC=$LFSC_HOME/lfsc
if ( [ $? = 0 ] ) ; then
  #mkdir -pv /mnt/$LFSC_SDA
  #mount /dev/$LFSC_SDA /mnt/$LFSC_SDA
  #copy to $LFSC_SDA:
  cp -r $LFSC/* /mnt/$LFSC_SDA
  cd /mnt/$LFSC_SDA
  chown -R root:root *
  mknod -m 0600 /mnt/$LFSC_SDA/dev/console c 5 1
  mknod -m 0666 /mnt/$LFSC_SDA/dev/null c 1 3
  #grub will have added new linux into the boot list:
  grub-mkconfig -o /boot/grub/grub.cfg
  #Change grub.cfg to point bash as INIT program for resque mode: /boot/vmlinuz-5.5.11 root=/dev/$LFSC_SDA rw init=/bin/bash:
  nano /boot/grub/grub.cfg
  exit 0
fi
exit 1

