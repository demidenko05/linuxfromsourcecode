#!/bin/bash
read -p "Enter host name name: " lfschostname
echo $lfschostname > $LFSC/etc/hostname
cat > $LFSC/etc/issue << "EOF"
Beigesoft Linux from source code V1.8 \n \l
EOF
