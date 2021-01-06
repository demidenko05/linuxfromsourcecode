#Beigesoft Linux From Source Code Version 1.8
#The first phase is cross compiling of MULTI-ARCH x86 Linux on building platform of same architecture (i.e. 64bit build for 64 bit target and so does 32bit)
#it's used the same arch (Nbit) target cause of gcc multilib can not yet be compiled for another acrh target by this method
#it's tested only 64bit!
#this is for programmers, so multi-arch is mandatory 
#it's used "sysroot" cross-compiling method with native x86 GCC, i.e. without target compiling tool-chain
#It's checked on Debian 9.11 amd64 LXDE
#step*.sh are macro-installers, see others more atomic BASH scripts for details
#$echo $? - will shows 0 if previous step worked fine
#all sources versions are same/close as in Debian 9

-----------------------------------------------------
#making new Linux distribution takes a huge disk space, and it's a cause of HOME partition fragmentation, so you can use dedicated partition for it (about 20GB), just change envvars.sh and others files.

#1. unpack LFSC1.8.tar.xz in your home(or dedicated partition) :
cd $LFSC_HOME
tar xJf [path to]LFSC1.8.tar.xz
#change to it:
cd LFSC/cross1/src

#Phase A. make native GCC-9.3.0
#a) get and unpack sources:
#tar -xJf [path to].xz
#tar -xvf [path to].lz 
#tar -xjf [path to].bz2 
#tar -xzf [path to].gz
https://ftp.gnu.org/gnu/gmp/gmp-6.2.0.tar.xz.sig
https://www.mpfr.org/mpfr-4.0.2/mpfr-4.0.2.tar.xz.asc
  https://www.mpfr.org/mpfr-4.0.2/allpatches---
  patch -N -Z -p1 < [path to allpatches]
https://ftp.gnu.org/gnu/mpc/mpc-1.1.0.tar.gz.sig
isl-0.18
https://ftp.gnu.org/gnu/gcc/gcc-9.3.0/gcc-9.3.0.tar.xz.sig

# move gmp mpc mpfr isl into gcc source with renaming, e.g.:
mv isl-0.18 gcc-9.3.0/isl
...
#b) compile native gcc:
#set $LFSC_HOME if it's not your home:
nano ../envvars-gccn.sh
#set vars:
source ../envvars-gccn.sh
#compile:
sh ../step0.sh
#as root install gcc9.3.0:
cd bgccn
make install
#and make it current:
sh ../../step0root.sh

#Phase B.cross-compiling:
#B.1 get and unpack sources:
#These are all necessary for farther native compiling and some easy-to-cross-compile software:
#you should download sources under root and check their signatures:
https://sourceforge.net/projects/libpng  zlib 1.2.11 xz
https://ftp.gnu.org/gnu/binutils/binutils-2.34.tar.xz.sig
https://cdn.kernel.org/pub/linux/kernel/v5.x/linux-5.5.11.tar.xz.sign
https://ftp.gnu.org/gnu/glibc/glibc-2.31.tar.xz.sig
https://data.iana.org/time-zones/releases/tzdb-2019c.tar.lz.asc
https://mirrors.edge.kernel.org/pub/linux/docs/man-pages/man-pages-5.05.tar.sign
https://ftp.gnu.org/gnu/coreutils/coreutils-8.31.tar.xz.sig
https://mirrors.edge.kernel.org/pub/linux/libs/security/linux-privs/libcap2/libcap-2.33.tar.xz.sign
https://ftp.gnu.org/gnu/ncurses/ncurses-6.2.tar.gz.sig
http://download.savannah.gnu.org/releases/attr/attr-2.4.48.src.tar.gz.sig
http://download.savannah.gnu.org/releases/acl/acl-2.2.53.src.tar.gz.sig
https://sourceware.org/pub/bzip2/bzip2-1.0.8.tar.gz.sig
 xz-5.2.4 xz from https://sourceforge.net/projects/lzmautils/
https://ftp.gnu.org/gnu/gzip/gzip-1.10.tar.xz.sig
https://ftp.gnu.org/gnu/tar/tar-1.32.tar.xz.sig
https://mirrors.edge.kernel.org/pub/linux/utils/util-linux/v2.35/util-linux-2.35.tar.sign
https://mirrors.edge.kernel.org/pub/linux/kernel/people/tytso/e2fsprogs/v1.45.5/e2fsprogs-1.45.5.tar.sign
https://mirrors.edge.kernel.org/pub/linux/utils/kbd/kbd-2.2.0.tar.sign
https://mirrors.edge.kernel.org/pub/linux/utils/kernel/kmod/kmod-27.tar.sign
https://ftp.gnu.org/gnu/bison/bison-3.5.2.tar.xz.sig
https://ftp.gnu.org/gnu/readline/readline-8.0.tar.gz.sig
  and 4 pathes
  patch -p0 -i [path to readline80-001]...
https://ftp.gnu.org/gnu/gdbm/gdbm-1.18.tar.gz.sig
http://download.savannah.gnu.org/releases/libpipeline/libpipeline-1.5.2.tar.gz.asc
https://github.com/libexpat/libexpat/releases/download/R_2_2_9/expat-2.2.9.tar.xz.asc
https://ftp.gnu.org/gnu/sed/sed-4.8.tar.xz.sig
https://ftp.gnu.org/gnu/m4/m4-1.4.18.tar.xz.sig
https://ftp.gnu.org/gnu/gettext/gettext-0.20.tar.xz.sig
https://ftp.gnu.org/gnu/gperf/gperf-3.1.tar.gz.sig
https://ftp.gnu.org/gnu/grep/grep-3.4.tar.xz.sig
https://ftp.gnu.org/gnu/less/less-530.tar.gz.sig
https://ftp.gnu.org/gnu/gawk/gawk-5.0.1.tar.xz.sig
https://ftp.gnu.org/gnu/texinfo/texinfo-6.7.tar.xz.sig
https://ftp.gnu.org/gnu/make/make-4.3.tar.gz.sig
https://ftp.gnu.org/gnu/patch/patch-2.7.6.tar.xz.sig
https://ftp.gnu.org/gnu/libtool/libtool-2.4.6.tar.xz.sig
https://ftp.gnu.org/gnu/autoconf/autoconf-2.69.tar.xz.sig
https://ftp.gnu.org/gnu/automake/automake-1.16.1.tar.xz.sig
https://ftp.gnu.org/gnu/diffutils/diffutils-3.7.tar.xz.sig
https://ftp.gnu.org/gnu/findutils/findutils-4.7.0.tar.xz.sig
https://ftp.gnu.org/gnu/nano/nano-4.8.tar.xz.sig
https://ftp.gnu.org/gnu/bash/bash-5.0.tar.gz.sig
#text console screen-shot:
https://github.com/jwilk/fbcat/releases/download/0.5.1/fbcat-0.5.1.tar.gz.asc

#for re-usability, you should better make an unpack-cross.sh that unpacks and patches all sources for current step

#B.2. as root:
#modify step2root.sh and run it:
nano step2root.sh
bash step2root.sh
#!copy "cross-tools" invokers (e.g. i686-lfsc-linux-gnu-gcc) from LFSC/cross1/tool/* into /usr/bin!
cd $LFSC_HOME/LFSC/cross1/tools
chown root:root *
cp -iv * /usr/bin

#B.2C. as non-root move gmp mpc mpfr isl from gcc source with renaming, e.g.:
cd gcc-9.3.0
mv isl ../isl-0.18
...

#B.2D. fix m4 sources!:
sh ../fixm4.h

#if you use different building directory LFSC_HOME than your home, then set it in variables:
nano ../envvars.sh
#make environment variables:
source ../envvars.sh
#make sure:
echo $LFSC
#add locale you want:
nano ../localedef1.sh
#run first step for making LFSC root directories:
bash ../step1.sh

#B.3.modify variable in fls/fstab.sh and run under your home ~/LFSC/cross1/src:
nano ../../fls/fstab.sh
#actually cross-compiling into $LFSC:
bash ../step3.sh

#you will be asked about host name, editing bzip2/Makefile...

#configure kernel systemd dependent vars and drivers in menuconfig and/or directly in .config (F6 to search in nano)
# e.g. make this entry to suppress stack usage debug messages:
#CONFIG_DEBUG_STACK_USAGE is not set

#by default kernel doesn't recognize many devices, the trick - edit by hand .config before menuconfig and after (the most used monkey's method (pull, push, scratch and lick it then see what's happen) surely work)
#new kernel's config has "full-named" settings, e.g. REALTEK, ELANTECH, NOUVEAU, RADEON, SYNAPTICS...
#see also Debian's (or other's) modules, e.g. /lib/modules/4.9.0-11-amd64/modules.alias
#do also commands: xinput list, udevadm monitor, udevadm info --path=/sys/class/mmc_host/mmc0
#touchpad - udevadm info --path=/sys/class/input/mouse1/device
#lsmod lists loaded modules (not kernel's builins!)
#logs: journalctl -k | grep i8042 or dmesg | grep i8042 
#kernel 5 didn't recognize my touchpad, adding i8042.nopnp as kernel parameter didn't help
#this command still shows nothing:
grep -s --include=name -r /sys -i -e touch
#at long last I found https://forums.gentoo.org/viewtopic-t-1086512-start-0.html that clears the problem - it needs to enable X86_[...]_LPSS and CONFIG_PINCTRL_[...]
#make lists of sys's names/devices/vendors on working Debian(or other) and compare to LFSC ones:
find /sys -type f -name vendor -exec cat {} \; | sort > sysvendors.txt
find /sys -type f -name device -exec cat {} \; | sort > sysdevices.txt
find /sys -type f -name name -exec cat {} \; | sort > sysnames.txt
#to find vendor's name by ID grep in kernel sources,  e.g.
grep 0x168c -r . --include=*.h #also see https://www.linuxtopia.org/online_books/linux_kernel/kernel_configuration/ch08.html
#if a property is not appeared in .config, then seek it in Makefile in kernel source:
grep CONFIG_MMC_REALTEK_PCI -r . --include=Makefile
#Kconfig files tell about configuring and depending, and explain (help) about devices..., so going through these files maybe more efficient than exploring with help in menuconfig
#sometime it's important for sound to say Y instead of M, they even made comment: "Set to Y if you want auto-loading the codec driver", e.g. SND_HDA_CODEC_REALTEK

#final cross-step B.4 as root make partition for new linux, and run by hand all entries from step4root.sh
#Change grub.cfg to point bash as INIT program for rescue mode:
linux /boot/vmlinuz-5.5.11 root=/dev/$LFSC_SDA rw init=/bin/bash
#optional you can add entry to boot into systemd rescue mode in future:
linux /boot/vmlinuz-5.5.11 root=/dev/$LFSC_SDA systemd.unit=rescue.target

reboot into LFSC init-bash mode

----native compiling under init-bash phase#1--------- 

#reboot in bash rescue mode, then mount partition the source code (if it's on separate partition), then make environment vars:
#make environment vars:
source [path to LFSC]/fls/profile-zero.sh

#cross-made locales will not work, so
nano ../localedef1.sh
sh ../localedef1.sh

#get these additional sources:
https://github.com/linux-pam/linux-pam/   Linux-PAM-1.3.1 .xz
patches from https://packages.debian.org/buster/libpam0g pam_1.3.1-5.debian.tar.xz and unpack it into PAM source
#apply all 25 patches (see series file):
cd Linux-PAM-1.3.1
patch -Np1 -i debian/patches-applied/pam_unix_fix_sgid_shadow_auth.patch
...
patch -Np1 -i debian/patches-applied/fix-autoreconf.patch

https://github.com/shadow-maint/shadow/releases/download/4.8.1/shadow-4.8.1.tar.xz.asc
https://pkg-config.freedesktop.org/releases/pkg-config-0.29.2.tar.gz.asc
ftp://ftp.astron.com/pub/file/file-5.38.tar.gz.asc
https://www.cpan.org/src/5.0/perl-5.30.1.tar.xz.sha256.txt
https://ftp.gnu.org/gnu/groff/groff-1.22.4.tar.gz.sig
https://github.com/westes/flex/releases/download/v2.6.4
man-db-2.7.6.1
https://mirrors.edge.kernel.org/pub/linux/utils/net/iproute2/iproute2-5.5.0.tar.sign
https://ftp.gnu.org/gnu/which/which-2.21.tar.gz.sig
https://github.com/libffi/libffi/releases/ libffi-3.3.tar.gz
https://www.python.org/ftp/python/3.8.1/Python-3.8.1.tar.xz.asc
https://cpan.metacpan.org/authors/id/T/TO/TODDR/  XML::Parser (2.46) tar.gz
https://launchpad.net/intltool/trunk/0.51.0/+download/intltool-0.51.0.tar.gz.asc
ninja-1.10.0 gz
meson-0.53.1 gz
https://pypi.org/project/Mako/#files MarkupSafe-1.1.1 gz
https://pypi.org/project/Mako/#files Mako-1.1.1 gz (for mesa building)
https://www.openssl.org/source/openssl-1.1.1e.tar.gz.asc 
https://github.com/systemd/systemd/releases/ v244 .tar.gz 
https://dbus.freedesktop.org/releases/dbus/dbus-1.13.12.tar.xz.asc
https://sourceforge.net/projects/infozip unzip60.tar.gz

#cd to native source, and make and load envars (point LFSC_HOME!) for compiling:
nano ../envars.sh
source ../envars.sh
cd [path to LFSC]/native/src
#unpack/patch all sources
#compile programs from shadow, perl up to systemd and dbus:
sh ../step1.sh
reboot

#you will see that systemd loads all stuff by itself, i.e. without any additional hand-made scripts

----native compiling under init-systemd phase#2--------- 

#reboot under systemd (default boot)
#at first boot systemd will ask you about locale, timezone and root password.
#press CTRL-ALT-F2 to switch into tty2 and login as root
journalctl -xe
#missed machine-id...
#you must generate machine-id:
systemd-machine-id-setup
#and make man user:
#tmpfiles.d man-db.conf unknown user "man":
useradd -U man

reboot

#Aims of this phase are:
#1. reinstalling cause cross(mutual)-depending (e.g. installing systemd depends of dbus and vice versa)
#2. native testing (testing is difficult and sometimes unreliable during cross-compiling)
#3. make sure that it is a reliable Linux that can compile (bear) a another cross-compiled Linux

#press CTRL-ALT-F2 to switch into tty2 and login as root
#add user for compiling:
useradd -Um [user_name]
passwd [user_name]
#change LFSC owner files:
cd [path to LFSC]
chown -R [user_name]:[user_name] LFSC
#press CTRL-ALT-F3 to switch into tty3 and login as new user for compiling
cd [path to LFSC]/native/src
#make environment variables,  e.g LDFLAGS="-Wl,--enable-new-dtags":
source ../envvars.sh
#reinstall glibc (it takes a big time for testing glibc):
#unpack glibc
sh ../step2.sh
#it will be error (maybe cause is previous cross-compiling), so you will be asked:
# add conditions to disable libs [lib_test2, nsl, nss_nis, nss_nisplus] in scripts/test-installation.pl
#after that "ldconfig -p" shows properly multilibs:
ldconfig -p
reboot

#press CTRL-ALT-F3 to switch into tty3 and login as new user for compiling
cd [path to LFSC]/native/src
#unpack sources: gmp-binutils
source ../envvars.sh
#reinstall gmp...binutils:
sh step3.sh
reboot

cd [path to LFSC]/native/src
source ../envvars.sh
#install programs for testing GCC, autogen, dejagnu, XML... and reinstall GCC (it takes a lot of time for multi-staged gcc with testing):
#get additional sources and unpack:
http://xmlsoft.org/   libxml2-sources-2.9.9 gz
http://xmlsoft.org/   libxslt-1.1.34 gz
http://itstool.org/  itstool-2.0.6 .bz2
https://github.com/bitwiseworks/sgml-common-os2 0.6.3-os2 gz
https://cpan.metacpan.org/ Path-Tiny-0.112 gz
https://cpan.metacpan.org/ XML-XPath-1.44 gz
http://www.docbook.org  docbook-xml-4.5 zip
mkdir -pv docbook-xml-4.5
cd docbook-xml-4.5
unzip [path-to]/docbook-xml-4.5.zip
cd ..
https://github.com/docbook/xslt10-stylesheets releases docbook-xsl-nons-1.79.2 bz2 
http://www.linuxfromscratch.org/patches/blfs/9.0/    docbook-xsl-nons-1.79.2-stack_fix-1.patch
cd docbook-xsl-nons-1.79.2
patch -Np1 -i [path-to]/docbook-xsl-nons-1.79.2-stack_fix-1.patch
cd ..
https://releases.pagure.org/xmlto/ xmlto-0.0.28 gz
#for tests (gcc...):
https://sourceforge.net/projects/tcl/files/Tcl/  tcl8.6.10-src.tar.gz
https://sourceforge.net/projects/expect/files/Expect/  expect5.45.4.tar.gz
https://ftp.gnu.org/gnu/dejagnu/dejagnu-1.6.2.tar.gz.sig
https://github.com/libcheck/check 0.14.0 gz
https://ftp.pcre.org/pub/pcre/pcre-8.44.tar.gz.sig
https://github.com/ivmai/libatomic_ops/ libatomic_ops-7.6.10 gz (for libgc)
https://ftp.gnu.org/gnu/libunistring/libunistring-0.9.10.tar.xz.sig
https://launchpad.net/libgc/main/7.4.0/+download/ gc-7.4.0.tar.gz
https://ftp.gnu.org/gnu/guile/guile-2.0.14.tar.xz.sig    #26/27 give : test-out-of-memory fail, this bug is since OCT 2017
#TODO next version guile2.2.4 + patches (including disabling test-out-of-memory) http://deb.debian.org/debian/pool/main/g/guile-2.2/guile-2.2_2.2.4+1-2+deb10u1.debian.tar.xz
https://ftp.gnu.org/gnu/autogen/autogen-5.18.7.tar.xz.sig #autogen 5.18.16 error getdefs.c 

sh ../step4.sh
reboot

guile 7 test failures

----reinstall/install with test all software up to X11:----

cd [path to LFSC]/native/src
source ../envvars.sh
#get additional sources:
#for kernel:
https://curl.haxx.se/download/curl-7.68.0.tar.xz.asc
https://ftp.gnu.org/gnu/libmicrohttpd/libmicrohttpd-0.9.70.tar.gz.sig
https://www.libarchive.org/downloads/libarchive-3.4.2.tar.xz
https://www.sqlite.org/2020/   sqlite-autoconf-3310100.tar.gz
https://sourceware.org/ftp/elfutils/0.178/elfutils-0.178.tar.bz2.sig
https://ftp.gnu.org/gnu/bc/bc-1.07.1.tar.gz.sig
http://download.savannah.gnu.org/releases/lzip/lzip-1.21.tar.gz.sig
sourceforge: procps-ng-3.3.15
sourceforge: psmisc-23.3
https://ftp.gnu.org/gnu/gdb/gdb-8.3.tar.xz.sig
https://yasm.tortall.net/ yasm-1.3.0 gz
https://www.nasm.us/ nasm-2.14.02 xz
https://github.com/git/git/  v2.25.1.tar.gz
https://github.com/HewlettPackard/wireless-tools/  v29.tar.gz
 and http://www.linuxfromscratch.org/patches/blfs/9.0/    wireless_tools-29-fix_iwlist_scanning-1.patch
cd wireless-tools-29/wireless_tools
patch -Np1 -i [path-to]/wireless_tools-29-fix_iwlist_scanning-1.patch
cd ../../
git clone https://salsa.debian.org/iso-codes-team/iso-codes.git
git archive HEAD -o [path]/iso-codes-last.tar.gz
mkdir iso-codes-last
cd iso-codes-last
tar xzf [path]/iso-codes-last.tar.gz
cd ..
https://github.com/unicode-org/icu/releases/download/release-65-1/icu4c-65_1-src.tgz.asc
https://ftp.gnu.org/gnu/grub/grub-2.04.tar.xz.sig
#for hardware detection:
https://mirrors.edge.kernel.org/pub/software/utils/pciutils/pciutils-3.6.4.tar.sign xz
https://github.com/libusb/libusb/   libusb-1.0.23  bz2
https://mirrors.edge.kernel.org/pub/linux/utils/usb/usbutils/usbutils-012.tar.sign xz

#(re)install:
sh step5.sh

#When you got test error, then you can "cd [bdir] && su -c "make install"", then edit step#.sh, then run it again

Fail tests:
glibc32/64 - OK, but glibc64 during "make install" scripts/test-installation.pl throws error "ld not found -lnss_nis", Debian has glibc2.24's libraries libnsl(nss_nis, nss_nisplus) both 32 and 64 bit, but LFSC hasn't.
grub - 46 (but current (working) grub is in another partition)
acl - 2
sed - 1 error
utillinux - 1, but it installs su with wrong attributes in case of "non-root installing"
libtool: 9 fail (5 expected failure)
autoconf: 139 fail (4 expected)
automake - 8
python3 - 7 failed
systemd - meson-test fail on "test-string-util.c:150 test_cellescape()"


--the last step is X11-LXDE GUI:--
#get sources preX11:
https://dist.libuv.org/dist/v1.34.2/libuv-v1.34.2.tar.gz.sign
https://cmake.org/files/ cmake-3.16.4  gz (for LLVM)
https://github.com/llvm/llvm-project/releases/ llvm-9.0.1 xz Java-like bitcode VM
https://sourceforge.net/projects/libpng/  libpng16   1.6.37 xz
https://sourceforge.net/projects/libjpeg-turbo/ libjpeg-turbo-2.0.4 gz
https://sourceforge.net/projects/giflib giflib-5.2.1 gz
https://www.cl.cam.ac.uk/~mgk25/jbigkit/  jbigkit-2.1 gz
https://github.com/facebook/zstd/  v1.4.4 gz
https://download.osgeo.org/libtiff/tiff-4.1.0.tar.gz.sig (RECOMPILE for freeglut)
https://storage.googleapis.com/downloads.webmproject.org/releases/webp/libwebp-1.1.0.tar.gz.asc (RECOMPILE for freeglut, libtiff)
https://sourceforge.net/projects/freetype/  freetype2 2.10.1 xz
https://www.freedesktop.org/software/fontconfig/release/ fontconfig-2.13.92.tar  .xz

cd [path to LFSC]/native/src
source ../envvars.sh
sh step6.sh

#get sources X11:
https://www.x.org/releases/individual/doc/xorg-sgml-doctools-1.11   gz
https://www.x.org/releases/individual/doc/xorg-docs-1.7.1   bz2
https://www.x.org/releases/individual/util/util-macros-1.19.2   gz
https://www.x.org/releases/individual/proto/xorgproto-2019.2   gz
#many protos seem to be useless, cause xorgproto-2019.2 already included them, especially presentproto-1.1 that is too old.
https://www.x.org/releases/individual/lib/libXdmcp   gz
https://www.x.org/releases/individual/xcb/xcb-proto-1.13   gz
https://www.x.org/releases/individual/xcb/libpthread-stubs-0.4   gz
https://www.x.org/releases/individual/xcb/libxcb-1.13.1   gz
https://www.x.org/releases/individual/lib/libX11-1.6.9   gz
https://www.x.org/releases/individual/lib/xtrans-1.4.0   gz
https://www.x.org/releases/individual/lib/pixman-0.38.4   gz
https://www.x.org/releases/individual/lib/libpciaccess-0.16   gz
https://dri.freedesktop.org/libdrm/libdrm-2.4.100.tar.gz.sig
https://www.x.org/releases/individual/lib/libxshmfence-1.3   gz
https://www.x.org/releases/individual/lib/libxkbfile-1.1.0   gz
https://www.x.org/releases/individual/lib/libfontenc-1.1.4   gz
https://www.x.org/releases/individual/lib/libXext-1.3.4   gz
https://www.x.org/releases/individual/lib/libdmx-1.1.4.tar.gz.sig
https://www.x.org/releases/individual/lib/libXxf86vm-1.1.4   gz
https://www.x.org/releases/individual/lib/libXxf86vm-1.1.4   gz
https://www.x.org/releases/individual/proto/xf86miscproto-0.9.3   gz
https://www.x.org/releases/individual/lib/libXxf86misc-1.0.4   gz
https://www.x.org/releases/individual/lib/libXxf86dga-1.1.5   gz
https://www.x.org/releases/individual/lib/libXv-1.0.11   gz
https://www.x.org/releases/individual/lib/libXfixes-5.0.3.tar.gz   gz
https://www.x.org/releases/individual/lib/libXi-1.7.10   gz
https://www.x.org/releases/individual/lib/libXtst-1.2.3   gz
https://www.x.org/releases/individual/lib/libICE-1.0.10   gz
https://www.x.org/releases/individual/lib/libSM-1.2.3   gz
https://www.x.org/releases/individual/lib/libXt-1.2.0   gz
https://www.x.org/releases/individual/lib/libXres-1.2.0   gz
https://www.x.org/releases/individual/lib/libXrender-0.9.10   gz
https://www.x.org/releases/individual/lib/libXrandr-1.5.2   gz
https://www.x.org/releases/individual/lib/libXpm-3.5.13   gz
https://www.x.org/releases/individual/proto/printproto-1.0.5   gz
https://www.x.org/releases/individual/lib/libXau-1.0.9   gz
https://www.x.org/releases/individual/lib/libXp-1.0.3   gz
https://www.x.org/releases/individual/lib/libXmu-1.1.3   gz
## Xproto######https://www.x.org/releases/individual/proto/presentproto-1.1  gz !!!xorgproto has new one!!! it's too old and causes error xserver PresentCompleteModeSuboptimalCopy undeclared!!
#https://www.x.org/releases/individual/lib/libXpresent-1.0.0   gz ?
https://www.x.org/releases/individual/lib/libXinerama-1.1.4   gz
https://www.x.org/releases/individual/lib/libXft-2.3.3   gz
https://www.x.org/releases/individual/lib/libXfont2-2.0.4   gz
https://www.x.org/releases/individual/lib/libXdamage-1.1.5   gz
https://www.x.org/releases/individual/lib/libXcursor-1.2.0   gz
https://www.x.org/releases/individual/lib/libXcomposite-0.4.5   gz
https://www.x.org/releases/individual/lib/libXaw-1.0.13.tar.gz.sig
https://www.x.org/releases/individual/lib/libXaw3d-1.6.3   gz
https://www.x.org/releases/individual/lib/libXScrnSaver-1.2.3   gz
https://www.x.org/releases/individual/lib/libSM-1.2.3   gz
https://www.x.org/releases/individual/lib/libFS-1.0.8   gz

https://www.x.org/releases/individual/xcb/xcb-util-0.4.0   gz
https://www.x.org/releases/individual/xcb/xcb-util-renderutil-0.3.9   gz
https://www.x.org/releases/individual/xcb/xcb-util-image-0.4.0   gz
https://www.x.org/releases/individual/xcb/xcb-util-cursor-0.1.3   gz
https://www.x.org/releases/individual/xcb/xcb-util-errors-1.0   gz
https://www.x.org/releases/individual/xcb/xcb-util-keysyms-0.4.0   gz
https://www.x.org/releases/individual/xcb/xcb-util-wm-0.4.1   gz

https://mesa.freedesktop.org/archive/mesa-20.0.0.tar.xz.sig
https://mesa.freedesktop.org/archive/glu/glu-9.0.1.tar.xz.sig
https://sourceforge.net/projects/freeglut  freeglut-3.2.1 .gz
https://www.x.org/releases/individual/data/xbitmaps-1.1.2   gz
https://www.x.org/releases/individual/app/xwud-1.0.5   gz
https://www.x.org/releases/individual/app/xwininfo-1.1.5   gz
https://www.x.org/releases/individual/app/xwd-1.0.7   gz
https://www.x.org/releases/individual/app/xvinfo-1.1.4   gz
https://www.x.org/releases/individual/app/xstdcmap-1.0.4   gz
https://www.x.org/releases/individual/app/xsetroot-1.1.2   gz
https://www.x.org/releases/individual/app/xset-1.2.4   gz
https://www.x.org/releases/individual/app/xrefresh-1.0.6   gz
https://www.x.org/releases/individual/app/xrdb-1.2.0.tar.gz.sig
https://www.x.org/releases/individual/app/xrandr-1.5.1.tar.xz.sig
https://www.x.org/releases/individual/app/xprop-1.2.4.tar.gz.sig
https://www.x.org/releases/individual/app/xpr-1.0.5.tar.gz.sig
https://www.x.org/releases/individual/app/xmore-1.0.3.tar.gz.sig
https://www.x.org/releases/individual/app/xmodmap-1.0.10.tar.gz.sig
https://www.x.org/releases/individual/app/xmessage-1.0.5.tar.gz.sig
https://www.x.org/releases/individual/app/xman-1.1.5.tar.gz.sig
https://www.x.org/releases/individual/app/xlsfonts-1.0.6.tar.gz.sig
https://www.x.org/releases/individual/app/xlsclients-1.1.4.tar.gz.sig
https://www.x.org/releases/individual/app/xlsatoms-1.1.3.tar.gz.sig
https://www.x.org/releases/individual/app/xlogo-1.0.5.tar.gz.sig
https://www.x.org/releases/individual/app/xload-1.1.3.tar.gz.sig
https://www.x.org/releases/individual/app/xkill-1.0.5.tar.gz.sig
https://www.x.org/releases/individual/app/xkbutils-1.0.4 gz
https://www.x.org/releases/individual/app/xkbprint-1.0.5.tar.gz.sig
https://www.x.org/releases/individual/app/xkbevd-1.1.4.tar.gz.sig
https://www.x.org/releases/individual/app/xkbcomp-1.4.3.tar.gz.sig
https://www.x.org/releases/individual/app/xinput-1.6.3.tar.gz.sig
https://www.x.org/releases/individual/app/xinit-1.4.1.tar.gz.sig
https://www.x.org/releases/individual/app/xhost-1.0.8.tar.gz.sig
https://www.x.org/releases/individual/app/xgamma-1.0.6.tar.gz.sig
https://www.x.org/releases/individual/app/xfontsel-1.0.6.tar.gz.sig
https://www.x.org/releases/individual/app/xfd-1.1.3.tar.gz.sig
https://www.x.org/releases/individual/app/xev-1.2.3.tar.gz.sig
https://www.x.org/releases/individual/app/xdriinfo-1.0.6.tar.gz.sig
https://www.x.org/releases/individual/app/xdpyinfo-1.3.2.tar.gz.sig
https://www.x.org/releases/individual/app/xcursorgen-1.0.7.tar.gz.sig
https://www.x.org/releases/individual/app/xcmsdb-1.0.5.tar.gz.sig
https://www.x.org/releases/individual/app/xbacklight-1.2.3.tar.gz.sig
https://www.x.org/releases/individual/app/xauth-1.1.tar.gz.sig
https://www.x.org/releases/individual/app/x11perf-1.6.1.tar.gz.sig
https://www.x.org/releases/individual/app/smproxy-1.0.6.tar.gz.sig
https://www.x.org/releases/individual/app/setxkbmap-1.3.2.tar.gz.sig
https://www.x.org/releases/individual/app/sessreg-1.1.2.tar.gz.sig
https://www.x.org/releases/individual/app/mkfontscale-1.2.1.tar.gz.sig
https://www.x.org/releases/individual/app/mkfontdir-1.0.7.tar.gz
###https://www.x.org/releases/individual/app/luit-1.1.1.tar.gz sys.c:339:5: error: implicit declaration of function 'posix_openpt'
https://invisible-island.net/luit/#download luit-20190106 gz
https://www.x.org/releases/individual/app/iceauth-1.0.8.tar.gz.sig
https://www.x.org/releases/individual/app/bitmap-1.0.9.tar.gz.sig
https://www.x.org/releases/individual/app/bdftopcf-1.1.tar.gz.sig
https://www.x.org/releases/individual/data/xcursor-themes-1.0.6.tar.gz.sig
#https://www.x.org/releases/individual/data/xkeyboard-config/xkeyboard-config-2.29.tar.gz.sig xkbcomp XF86FullScreen problem
https://www.x.org/releases/individual/data/xkeyboard-config/xkeyboard-config-2.28.tar.gz.sig
https://www.x.org/releases/individual/font/font-util-1.3.2.tar.gz.sig
https://www.x.org/releases/individual/font/encodings-1.0.5.tar.gz.sig
https://www.x.org/releases/individual/font/font-alias-1.0.3 gz
https://www.x.org/releases/individual/font/font-adobe-utopia-type1-1.0.4 gz
https://www.x.org/releases/individual/font/font-bh-ttf-1.0.3 gz
https://www.x.org/releases/individual/font/font-bh-type1-1.0.3 gz
https://www.x.org/releases/individual/font/font-misc-cyrillic-1.0.3 gz
https://github.com/anholt/libepoxy/ libepoxy-1.5.4 xz
https://www.x.org/releases/individual/font/font-xfree86-type1-1.0.4 gz
https://www.x.org/releases/individual/xserver/xorg-server-1.20.7.tar.gz.sig
https://www.freedesktop.org/software/libevdev/libevdev-1.8.0.tar.xz.sig
http://bitmath.org/code/mtdev/                      mtdev-1.1.6.tar         .gz
https://www.x.org/releases/individual/driver/xf86-input-evdev-2.10.6.tar.gz.sig
https://www.freedesktop.org/software/libinput/libinput-1.15.2.tar.xz.sig
https://www.x.org/releases/individual/driver/xf86-input-libinput-0.29.0.tar.gz.sig
https://www.x.org/releases/individual/driver/xf86-input-synaptics-1.9.1.tar.gz.sig
https://www.x.org/releases/individual/driver/xf86-video-fbdev-0.5.0.tar.gz.sig
#generic on-board, for more see https://01.org/linuxgraphics/
### https://www.x.org/releases/individual/driver/xf86-video-intel-2.99.917 gz doesn't work
git clone git://anongit.freedesktop.org/xorg/driver/xf86-video-intel
git archive HEAD -o [path]/xf86-video-intel-last.tar.gz
#this is first bug-fixer: git checkout d39197bb10b7d88cb4c456e7a5e8d34c1dc6eeaf
#git archive HEAD -o xf86-video-intel-abi23.tar.gz
mkdir xf86-video-intel-last
cd xf86-video-intel-last
tar -xzf [path]/xf86-video-intel-last.tar.gz
#optional NVIDIA CONFIG_DRM_NOUVEAU=y:
https://www.x.org/releases/individual/driver/xf86-video-nouveau-1.0.16.tar.gz.sig
#make driver for your VCARD, linux kernel must be configured for it, e.g. CONFIG_DRM_RADEON=y

sh step7.sh

#get sources before LXDE:
https://ftp.acc.umu.se/pub/gnome/sources/glib/2.63/glib-2.63.5.sha256sum xz
https://www.cairographics.org/releases/cairo-1.16.0.tar.xz.sha1.asc
https://www.freedesktop.org/software/harfbuzz/release/harfbuzz-2.6.3.tar.xz.sha256.asc
https://github.com/fribidi/fribidi/ fribidi-1.0.8  bz2
https://ftp.gnome.org/pub/GNOME/sources/pango/1.44/  pango-1.44.7 .xz 
https://download.gnome.org/sources/atk/2.35/atk-2.35.1.sha256sum
https://gitlab.freedesktop.org/xdg/shared-mime-info  releases  shared-mime-info-1.15  xz
https://icon-theme.freedesktop.org/releases   hicolor-icon-theme-0.17 xz
https://download.gnome.org/sources/gdk-pixbuf/  gdk-pixbuf-2.38.2.tar.xz (RECOMPILE for librsvg)
https://download.gnome.org/sources/gtk+/  gtk+-2.24.32.tar.xz
https://ftp.gnome.org/pub/gnome/sources/libcroco/ libcroco-0.6.13.tar.xz
https://www.ece.uvic.ca/~frodo/jasper/software/  jasper-2.0.14 gz
https://sourceforge.net/projects/enlightenment imlib2-1.6.1 bz2
https://ftp.acc.umu.se/pub/gnome/sources/gtk-engines/ gtk-engines-2.20.2.tar.gz
https://github.com/kupferlauncher/keybinder/ keybinder-0.3.1 gz
https://ftp.acc.umu.se/pub/gnome/sources/libglade/2.6/  libglade-2.6.4 gz
#https://www.freedesktop.org/wiki/Software/LibXklavier/ -> https://ftp.acc.umu.se/pub/gnome/sources/libxklavier/ libxklavier-5.3 xz
https://people.freedesktop.org/~svu/  libxklavier-5.4 bz2
https://www.freedesktop.org/software/startup-notification/releases/ startup-notification-0.12 .gz
https://github.com/uclouvain/openjpeg/ openjpeg-2.3.1 v2.3.1.tar.gz
#spell libs:
https://ftp.gnu.org/gnu/aspell/aspell-0.60.8.tar.gz.sig
https://github.com/hunspell/hunspell/ hunspell-1.7.0 gz
https://github.com/AbiWord/enchant/ enchant-2.2.8.tar.gz
https://ftp.acc.umu.se/pub/gnome/sources/librsvg/2.40/   librsvg-2.40.21 .xz
#for mc:
https://www.jedsoft.org/releases/slang/slang-2.3.2.tar.bz2.asc
#textual file explorer:
#some vendors use self-signed certificates or non-matched to URL (here is for *.osuosl.org), and this is much more safe than HTTP, so just ignore error:
wget --no-check-certificate https://ftp.midnight-commander.org/mc-4.8.23.sha256 xz (last 24 gives -> errorgmacros.h error unexpected identifier before do)

sh step8.sh

#get LXDE sources:
#https://www.freedesktop.org/software/polkit/releases/polkit-0.113.tar.gz.sign is the last release that requires mozjs (0.105 is without mozjs, so how mozjs can improve security?)
#BUT both releases js185 and mozjs17 can not be compiled without magic patches (sources - https://ftp.mozilla.org/pub/spidermonkey/releases/1.8.5/ ...)
#in additional - all (Debian, RedHat...) dropped out js185! So the choice is polkit0.105:
https://www.freedesktop.org/software/polkit/releases/polkit-0.105.tar.gz.sign
#and all patches: https://packages.debian.org/buster/policykit-1 policykit-1_0.105-25.debian.tar.xz and unpack it into POLKIT
cd polkit-0.105
#do it for all 50 patches in order as in series file:
patch -Np1 -i debian/patches/0.106/agenthelper-pam-Fix-newline-trimming-code.patch
...
patch -Np1 -i debian/patches/0.116/backend-Compare-PolkitUnixProcess-uids-for-temporary-auth.patch
cd ..
https://dbus.freedesktop.org/releases/dbus-glib/dbus-glib-0.110.tar.gz.asc
https://sourceforge.net/projects/lxdm/ lxdm-0.5.3 xz
http://openbox.org/dist/openbox/openbox-3.6.1.tar.xz.asc
https://ftp.acc.umu.se/pub/gnome/sources/libwnck/2.30/libwnck-2.30.7.tar.xz
https://ftp.acc.umu.se/pub/gnome/sources/vte/0.28/vte-0.28.2.tar.xz
https://ftp.acc.umu.se/pub/gnome/sources/adwaita-icon-theme/3.32/adwaita-icon-theme-3.32.0.tar.xz
https://sourceforge.net/projects/lxde/files/: lxde-icon-theme-0.5.1
  lxmenu-data-0.1.5.tar.xz menu-cache-1.1.0.tar.xz lxpanel-0.10.0.tar.xz lxappearance-0.6.3.tar.xz
  lxsession-0.5.5.tar.xz lxde-common-0.99.2.tar.xz lxappearance-obconf-0.2.3.tar.xz lxinput-0.3.5.tar.xz
  lxrandr-0.3.2.tar.xz lxtask-0.1.9.tar.xz gpicview-0.2.5 lxterminal-0.3.2.tar.xz
https://sourceforge.net/projects/pcmanfm/files/ libfm-1.3.1.tar.xz  pcmanfm-1.3.1.tar.xz
#screenshot:
https://salsa.debian.org/eric/giblib/-/tags giblib-debian-1.2.4-12.tar.gz (imlib2 wrapper)
scrot 0.8 gz
#editor:
https://download.geany.org/geany-1.36.tar.gz.sig
#multimedia:
https://github.com/intel/libva/archive/  libva-    2.6.1.tar.gz
https://gitlab.freedesktop.org/vdpau/libvdpau/-/archive/1.3/   libvdpau-1.3  .bz2
https://www.alsa-project.org/files/pub alsa-lib-1.2.2 and alsa-utils-1.2.2
https://www.libsdl.org/release/SDL2-2.0.12.tar.gz.sig
https://github.com/libass/libass/archive/   libass- 0.14.0.tar.gz   <- subtitles
https://ffmpeg.org/releases/ffmpeg-4.2.2.tar.xz.asc <- audio-video codecs, player...
#fonts:
https://sourceforge.net/projects/dejavu or https://dejavu-fonts.github.io dejavu-fonts-2.37.tar.bz2

sh step9.sh
#you will be asked about editing polkit's configure and polkitbackendsessionmonitor-systemd.c files!

#after that enable lxde:
syctemctl enable lxdm
#replace pam.d lxdm:
cp ../../fls/pam.d/lxdm /etc/pam.d
chown root:root /etc/pam.d/lxdm
reboot

#bsdict and bsplay:
install additional libogg and libvorbis from:
https://xiph.org/downloads/ libogg-1.3.4.tar.xz then libvorbis-1.3.7.tar.gz
just unpack them, change into their dirs, and run generic install:
sh ../../generic.sh
then download bsdict and bsplay from https://github.com/demidenko05/bsplay[bsdict] and install them according to their readme.txt 

#see instructions in admin folder for farther setup keyboard, touchpad, sound...

#All binaries will be stripped during installation, so if you plan to debug an application, then disable stripping for it.

-------------------------------------------------------------------


references:
about multiarch and cross-compiling: https://wiki.debian.org/Multiarch

Linux From Scratch (LFS): http://www.linuxfromscratch.org

Cross-Compiled Linux From Scratch: https://trac.clfs.org/

DIY: Build a Custom Minimal Linux Distribution from Source by Petros Koutoupis:
https://www.linuxjournal.com/content/diy-build-custom-minimal-linux-distribution-source

software configuring:
https://wiki.archlinux.org/index.php

it consists of files from Debian, e.g. /etc/pam.d/*

-----------------------------------------

This intangible product (contracted "this") is under regular free license:
1) This is for any purpose.
2) There is no any warranty.
3) There is no any liability.
4) You must reference this in any your product that uses this.

sponsored by Beigesoft™ Enterprise Information System:
https://www.facebook.com/Beigesoft-Accounting-All-In-One-40115090067724
 or
https://sites.google.com/site/beigesoftware

Многие предприниматели записывают в блокнот или электронную таблицу информацию рода:
* кто и сколько мне должен
* кому и сколько я должен
* за сколько я могу продать оборудование прямо сейчас
...
Читайте как наиболее эффективно вести коммерческий бухгалтерский учет:
https://sites.google.com/site/beigesoftware/eis-iv

Yesterday you sold merchandise in foreign currency, and exchange rate was 1.5.
Today you received payment in foreign currency, and exchange rate is 1.2.
How to properly record this?
Read more about exchange gain or loss:
https://sites.google.com/site/beigesoftware/eis-bobs-pizza/eis-multicurrency
