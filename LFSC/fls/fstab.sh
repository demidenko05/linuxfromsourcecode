#!/bin/bash
#change root and swap  partitions:
set -e
LFSCSDARO=!!![sda3]!!!
if ( [ $? = 0 ] ) ; then
  LFSCSDASW=sda5
  if ( [ $? = 0 ] ) ; then
cat > $LFSC/etc/fstab << "EOF"
# Begin /etc/fstab

# file system  mount-point  type   options          dump  fsck
#                                                         order

EOF
echo "/dev/$LFSCSDARO     /            ext4  defaults         0     1" >> $LFSC/etc/fstab
echo "/dev/$LFSCSDASW     swap         swap   sw            0     0" >> $LFSC/etc/fstab
cat >> $LFSC/etc/fstab << "EOF"
sysfs /sys sysfs rw,nosuid,nodev,noexec,relatime 0 0
proc /proc proc rw,nosuid,nodev,noexec,relatime 0 0
udev /dev devtmpfs rw,nosuid,relatime,size=1932224k,nr_inodes=483056,mode=755 0 0
devpts /dev/pts devpts rw,nosuid,noexec,relatime,gid=5,mode=620,ptmxmode=000 0 0
tmpfs /run tmpfs rw,nosuid,noexec,relatime,size=388704k,mode=755 0 0
#devpts         /dev/pts     devpts gid=5,mode=620   0     0
#shm            /dev/shm     tmpfs  defaults         0     0

# End /etc/fstab
EOF
    exit 0
  fi
fi
exit 1
