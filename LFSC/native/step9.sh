#!/bin/bash
# in ..src with unpacked sources!:
set -e
lfscgrflibprfx=/usr
lfscexprfx=/usr/local

cd dbus-glib-0.110
./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
make
make check
if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
if ( [ $? = 0 ] ) ; then
  cd ../polkit-0.105
  read -p " Replace all libsystemd-login with libsystemd in configure!, e.g.:
...
... PKG_CONFIG --exists --print-errors libsystemd ...
...
Do you understand? " lfsctrash
  nano configure
  ./configure --prefix=$lfscgrflibprfx --sysconfdir=/etc --with-authfw=shadow --localstatedir=/var
  read -p " Add #define HAVE_SD_UID_GET_DISPLAY 1 into src/polkitbackend/polkitbackendsessionmonitor-systemd.c:
...
#define HAVE_SD_UID_GET_DISPLAY 1

typedef struct
{
  GSource source;
...
Do you understand? " lfsctrash
#systemd has sd-login.sd_uid_get_display
  nano src/polkitbackend/polkitbackendsessionmonitor-systemd.c
  make
  if test "$(id -u)" = "0"; then sh $LFSC_HOME/LFSC/native/polkiti.sh; else su -c "sh $LFSC_HOME/LFSC/native/polkiti.sh"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../alsa-lib-1.2.2
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscexprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../alsa-utils-1.2.2
  ./configure --sysconfdir=/etc --prefix=$lfscexprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then sh $LFSC_HOME/LFSC/native/alsai.sh; else su -c "sh $LFSC_HOME/LFSC/native/alsai.sh"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../dejavu-fonts-ttf-2.37
  if test "$(id -u)" = "0"; then sh $LFSC_HOME/LFSC/native/dejavu.sh; else su -c "sh $LFSC_HOME/LFSC/native/dejavu.sh"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../lxdm-0.5.3
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc --disable-consolekit
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../openbox-3.6.1
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libwnck-2.30.7
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../vte-0.28.2
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../libfm-1.3.1
  ./configure --disable-static --prefix=$lfscgrflibprfx --with-extra-only --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../adwaita-icon-theme-3.35.92
  ./configure --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../lxde-icon-theme-0.5.1
  ./configure --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../lxmenu-data-0.1.5
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../menu-cache-1.1.0
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  #reinstall for menu-cache
  cd ../libfm-1.3.1
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  #reinstall for menu-cache
  cd ../pcmanfm-1.3.1
  ./configure --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../lxpanel-0.10.0
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc --enable-alsa
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../lxappearance-0.6.3
  ./configure --disable-static --prefix=$lfscgrflibprfx --enable-dbus --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../lxsession-0.5.5
  ./configure --prefix=$lfscgrflibprfx --sysconfdir=/etc --enable-buildin-polkit --enable-buildin-clipboard
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../lxde-common-0.99.2
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../lxappearance-obconf-0.2.3
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../lxinput-0.3.5
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../lxrandr-0.3.2
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../lxtask-0.1.9
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#if ( [ $? = 0 ] ) ; then
 # cd ../lxhotkey-0.1.0
  #./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  #make
  #if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
#fi
if ( [ $? = 0 ] ) ; then
  cd ../gpicview-0.2.5
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../lxterminal-0.3.2
  ./configure --disable-static --prefix=$lfscgrflibprfx --sysconfdir=/etc
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
#screenshot:
if ( [ $? = 0 ] ) ; then
  cd ../giblib-debian-1.2.4-12
  ./configure --disable-static --prefix=$lfscexprfx
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../scrot-0.8
  ./configure --disable-static --prefix=$lfscexprfx
  make
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../geany-1.36
  ./configure --disable-static --prefix=$lfscexprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
#TODO useless?
  cd ../libva-2.6.1
  sh autogen.sh
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
#TODO useless?
  cd ../libvdpau-1.3
  mkdir -pv buildlfsc
  cd buildlfsc
  meson ..
  ninja
  if ( [ $LFSCTEST = 1 ] ) ; then
    ninja test
  fi
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then ninja install; else su -c "ninja install"; fi
fi
if ( [ $? = 0 ] ) ; then
  cd ../../libass-0.14.0
  sh autogen.sh
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscexprfx
  make -j$NCORES
  if test "$(id -u)" = "0"; then make install-strip; else su -c "make install-strip"; fi
fi
if ( [ $? = 0 ] ) ; then
 cd ../SDL2-2.0.12
  ./configure --sysconfdir=/etc --disable-static --prefix=$lfscexprfx
  make -j$NCORES
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi

if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi

#recompiling:
export LFSCTEST=0
if ( [ $? = 0 ] ) ; then
  cd ../mesa-20.0.0
  bash $LFSC_HOME/LFSC/native/mesa.sh
fi

if ( [ $? = 0 ] ) ; then
 cd ../ffmpeg-4.2.2
  ./configure --prefix=$lfscexprfx --enable-libass
  make -j$NCORES
  find . -type f -executable -exec strip --strip-debug '{}' \;
  if test "$(id -u)" = "0"; then make install; else su -c "make install"; fi
fi

if ( [ $? = 0 ] ) ; then
  cd ../systemd-244
  bash $LFSC_HOME/LFSC/native/systemd.sh
fi
if ( [ $? = 0 ] ) ; then
  mkdir -pv ../bdbus
  cd ../bdbus
  bash $LFSC_HOME/LFSC/native/dbus.sh
fi
if test "$(id -u)" = "0"; then ldconfig; else su -c "/sbin/ldconfig"; fi
if ( [ $? = 0 ] ) ; then
  echo "Installing LXDE, multimedia, editor  OK"
  exit 0
fi
echo "Something went wrong!"
exit 1
