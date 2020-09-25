#!/bin/bash
set -e
export LFSCTEST=0
#native phase#1 on init-bash Linux
#perl is required for building other apps:
cd perl-5.30.1
bash $LFSC_HOME/LFSC/native/perl.sh
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bpkgconfigr
  cd ../bpkgconfigr
  bash $LFSC_HOME/LFSC/native/pkgconfig.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../Linux-PAM-1.3.1
  ./configure --disable-static --prefix=/usr --sysconfdir=/etc
  read -p " Remove prefix -1.13 from aclocal and automake in Makefile:
  ...
  ACLOCAL = ${SHELL} /home/yury/LFSC/native/src/Linux-PAM-1.3.1/build-aux/missing aclocal-1.13
  ...
  Do you understand? " lfsctrash
  nano Makefile
  make
  find . -type f -executable -exec strip --strip-debug '{}' \;
  make install
fi
if ( [ $? = 0 ] ) ; then
  cd ../libcap-2.33
  bash $LFSC_HOME/LFSC/native/libcap.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bshadowr
  cd ../bshadowr
  bash $LFSC_HOME/LFSC/native/shadow.sh
fi

if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bfiler
  cd ../bfiler
  bash $LFSC_HOME/LFSC/native/file.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bgroffr
  cd ../bgroffr
  bash $LFSC_HOME/LFSC/native/groff.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bflexr
  cd ../bflexr
  bash $LFSC_HOME/LFSC/native/flex.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bmandbr
  cd ../bmandbr
  bash $LFSC_HOME/LFSC/native/mandb.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../iproute2-5.5.0
  bash $LFSC_HOME/LFSC/native/iproute2.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../which-2.21
  bash $LFSC_HOME/LFSC/native/which.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../blibffir
  cd ../blibffir
  bash $LFSC_HOME/LFSC/native/libffi.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bpython3r
  cd ../bpython3r
  bash $LFSC_HOME/LFSC/native/python3.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../XML-Parser-2.46
  bash $LFSC_HOME/LFSC/native/xmpparser.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bintltoolr
  cd ../bintltoolr
  bash $LFSC_HOME/LFSC/native/intltool.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../ninja-1.10.0
  bash $LFSC_HOME/LFSC/native/ninja.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../meson-0.53.1
  bash $LFSC_HOME/LFSC/native/meson.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../MarkupSafe-1.1.1
  python3 setup.py build
  python3 setup.py install --optimize=1
fi
if ( [ $? = 0 ] ) ; then
  cd ../Mako-1.1.1
  python3 setup.py install --optimize=1
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bopensslr
  cd ../bopensslr
  bash $LFSC_HOME/LFSC/native/openssl.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bdbus1r
  cd ../bdbus1r
  bash $LFSC_HOME/LFSC/native/dbus1-r.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../systemd-244
  bash $LFSC_HOME/LFSC/native/systemd.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bdbus2r
  cd ../bdbus2r
  bash $LFSC_HOME/LFSC/native/dbus.sh
fi
if ( [ $? = 0 ] ) ; then
  cd ../unzip60
  make -f unix/Makefile generic
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make prefix=/usr -f unix/Makefile install; else su -c "make -f unix/Makefile prefix=/usr install"; fi
fi
cp -rv ../../../fls/pam.d /etc
chown -R 0:0 /etc/pam.d
if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi
if ( [ $? = 0 ] ) ; then
  echo "Installing pkg-config, shadow, pam, file, groff, flex, mandb, perl, which, libffi, python3, xml-parser, intltool, ninja, meson, openssl, systemd, dbus OK, REBOOT TO SYSTEMD!"
  exit 0
fi
echo "Something went wrong!"
exit 1
