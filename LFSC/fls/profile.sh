#!/bin/bash
set -e
cat > $LFSC/etc/profile << "EOF"
if [ "`id -u`" -eq 0 ]; then
  export PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin"
else
  export PATH="/usr/local/bin:/usr/bin:/bin:/usr/local/games:/usr/games"
fi
export PS1="\u@\h:\w\$ "
export HISTCONTROL=ignoreboth:erasedups
export USER=`id -un`
export LOGNAME=$USER
export HOSTNAME=`/bin/hostname`
export HISTSIZE=1000
export HISTFILESIZE=1000
export LC_ALL=en_US.UTF-8
export SHELL=/bin/bash
export PAGER='/usr/bin/less'
export EDITOR='/usr/bin/nano'
export PKG_CONFIG_PATH="/lib/pkgconfig:/usr/lib/pkgconfig:/usr/share/pkgconfig:/usr/local/lib/pkgconfig:/usr/local/share/pkgconfig"
EOF
exit 0
