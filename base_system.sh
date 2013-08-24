#!/bin/bash

# Create file systems
echo Creating file systems
mkswap /dev/sda1
swapon /dev/sda1
mkfs.ext4 /dev/sda2

# Mount the partitions
echo Mounting partitions
mount /dev/sda2 /mnt

# Update livecd pacman
echo Update pacman on live cd
pacman -Syy

# Select a mirror
echo Setting pacman mirrors - this can take a while
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.original
rankmirrors -n 5 /etc/pacman.d/mirrorlist.original > /etc/pacman.d/mirrorlist

# Install the base system
echo Installing base system
pacstrap -i /mnt base base-devel

# Generate fstab (-L is for labels, -U is for UIDs)
echo Generating fstab
genfstab -L -p /mnt >> /mnt/etc/fstab

# chroot and run script to work in chrooted environment
echo Chroot and run chrooted script
mkdir /mnt/etc/archconfig
cp chrooted.sh /mnt/etc/chrooted.sh
chmod +x /mnt/etc/chrooted.sh
arch-chroot /mnt /etc/chrooted.sh

echo After chroot

echo Unmounting partitions
umount /mnt

anyKey "Installation step finished. Will shut down now."

