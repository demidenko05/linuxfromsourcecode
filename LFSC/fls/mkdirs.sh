#!/bin/bash
set -e
mkdir -pv $LFSC
mkdir -pv $LFSC/bin $LFSC/boot $LFSC/dev $LFSC/etc $LFSC/opt $LFSC/home $LFSC/lib $LFSC/ $LFSC/mnt $LFSC/media
mkdir -pv $LFSC/proc $LFSC/sbin $LFSC/srv $LFSC/sys $LFSC/var
mkdir -pv $LFSC/lib/firmware $LFSC/lib/modules
mkdir -pv $LFSC/etc/opt
mkdir -pv $LFSC/media/floppy $LFSC/media/cdrom
mkdir -pv $LFSC/var/lock $LFSC/var/log $LFSC/var/mail $LFSC/var/spool $LFSC/var/local $LFSC/var/opt $LFSC/var/cache $LFSC/var/lib
mkdir -pv $LFSC/var/lib/misc $LFSC/var/lib/locate
install -dv -m 0750 $LFSC/root
install -dv -m 1777 $LFSC/var/tmp
install -dv -m 1777 $LFSC/tmp
install -dv $LFSC/etc/init.d
mkdir -pv $LFSC/usr/bin $LFSC/usr/include $LFSC/usr/lib $LFSC/usr/sbin $LFSC/usr/src
mkdir -pv $LFSC/usr/local/bin $LFSC/usr/local/include $LFSC/usr/local/lib $LFSC/usr/local/sbin $LFSC/usr/local/src
mkdir -pv $LFSC/usr/share/doc $LFSC/usr/share/info $LFSC/usr/share/locale $LFSC/usr/share/man
mkdir -pv $LFSC/usr/local/share/doc $LFSC/usr/local/share/info $LFSC/usr/local/share/locale $LFSC/usr/local/share/man
mkdir -pv $LFSC/usr/share/misc $LFSC/usr/share/terminfo $LFSC/usr/share/zoneinfo
mkdir -pv $LFSC/usr/local/share/misc $LFSC/usr/local/share/terminfo $LFSC/usr/local/share/zoneinfo
mkdir -pv $LFSC/usr/share/man/man1 $LFSC/usr/share/man/man2 $LFSC/usr/share/man/man3 $LFSC/usr/share/man/man4 $LFSC/usr/share/man/man5 $LFSC/usr/share/man/man6 $LFSC/usr/share/man/man7 $LFSC/usr/share/man/man8
mkdir -pv $LFSC/usr/local/share/man/man1 $LFSC/usr/local/share/man/man2 $LFSC/usr/local/share/man/man3 $LFSC/usr/local/share/man/man4 $LFSC/usr/local/share/man/man5 $LFSC/usr/local/share/man/man6 $LFSC/usr/local/share/man/man7 $LFSC/usr/local/share/man/man8
mkdir -pv $LFSC/usr/lib/locale
#making links according Filesystem Hierarchy Standard
if ( [ $LFSC32B != 1 ] ) ; then
  ln -sv lib $LFSC/lib64
  ln -sv lib $LFSC/usr/lib64
  ln -sv lib $LFSC/usr/local/lib64
  mkdir -pv $LFSC/lib32 $LFSC/usr/lib32 $LFSC/usr/local/lib32
else
  ln -sv lib $LFSC/lib32
  ln -sv lib $LFSC/usr/lib32
  ln -sv lib $LFSC/usr/local/lib32
  mkdir -pv $LFSC/lib64 $LFSC/usr/lib64 $LFSC/usr/local/lib64
fi
ln -sv share/man $LFSC/usr/man
ln -sv share/doc $LFSC/usr/doc
ln -sv share/info $LFSC/usr/info
ln -sv share/man $LFSC/usr/local/man
ln -sv share/doc $LFSC/usr/local/doc
ln -sv share/info $LFSC/usr/local/info
mkdir -pv $LFSC/run
ln -svf ../run $LFSC/var/run
