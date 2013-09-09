#!/bin/bash

# Load settings
source "settings.conf"

# Launch all installation scripts from here

# Disk preparation
source "$PARTITION_DISKS_FILE"
source "$CREATE_FILE_SYSTEMS_FILE"
source "$MOUNT_PARTITIONS_FILE"

# Pacman-related
source "$UPDATE_ISO_PACMAN_FILE"
source "$RANK_MIRRORS_FILE"

# TODO: CLEAN UP THE REST

# Install base system
source base_system.sh

# chroot and run script to work in chrooted environment
echo Chroot and run chrooted script
mkdir /mnt/etc/archconfig
source download_scripts.sh /mnt/etc/archconfig
cp chrooted.sh /mnt/etc/archconfig/chrooted.sh
chmod +x /mnt/etc/archconfig/chrooted.sh
arch-chroot /mnt /etc/archconfig/chrooted.sh

source post_chroot.sh

# Run as a regular user
#source customisation.sh

echo "Ending install.sh"

