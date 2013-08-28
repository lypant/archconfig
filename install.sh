#!/bin/bash

echo "STARTING $0"

source partition_disk.sh
#source base_system.sh

## chroot and run script to work in chrooted environment
#echo Chroot and run chrooted script
#mkdir /mnt/etc/archconfig
#source download_scripts.sh /mnt/etc/archconfig
#cp chrooted.sh /mnt/etc/archconfig/chrooted.sh
#chmod +x /mnt/etc/archconfig/chrooted.sh
#arch-chroot /mnt /etc/archconfig/chrooted.sh

#source post_chroot.sh

echo "ENDING $0"

