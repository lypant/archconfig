#!/bin/bash

# Update livecd pacman
echo Update pacman on live cd
uncommentVar "TotalDownload" /etc/pacman.conf
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

