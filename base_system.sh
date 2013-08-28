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
source download_scripts.sh /mnt/etc/archconfig
cp chrooted.sh /mnt/etc/archconfig/chrooted.sh
chmod +x /mnt/etc/archconfig/chrooted.sh
arch-chroot /mnt /etc/archconfig/chrooted.sh

echo After chroot

echo Unmounting partitions
umount /mnt

#anyKey "Installation step finished. Will shut down now."

# Add regular user
echo Adding regular user
useradd -m -g users -G wheel,storage,power -s /bin/bash adam

# Set password
echo Setting password for regular user
#passwd adam
repeatUntilSuccess "passwd adam" 3 || echo -e "\nERROR: password unchanged\n"

echo Adding user to sudoers
# TODO - do it in a safer way... Here just for experiments
echo "adam ALL=(ALL) ALL" >> /etc/sudoers

