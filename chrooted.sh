#!/bin/bash

echo "Starting chrooted.sh"

source /etc/archconfig/functions.sh

# Set locales
echo "Setting locales"
sed -i 's/#en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
sed -i 's/#pl_PL.UTF-8 UTF-8/pl_PL.UTF-8 UTF-8/g' /etc/locale.gen

# Generate locales
echo "Generating locales"
locale-gen

# Set language
echo "Setting lanuage"
echo "LANG=en_US.UTF-8" > /etc/locale.conf
export LANG=en_US.UTF-8

# Optional? - Console keymap and font
# TODO - replace with favourite font when such is found
# TODO - think about setting necessary kernel params/switches etc to allow smooth initialization
# KEYMAP=pl
# FONT=Lat2-Terminus16
echo "Setting console keymap and font"
echo "KEYMAP=pl" > /etc/vconsole.conf
echo "FONT=Lat2-Terminus16" >> /etc/vconsole.conf

# Set time zone
echo "Setting time zone"
ln -s /usr/share/zoneinfo/Europe/Warsaw /etc/localtime

# Set hardware clock
echo "Setting hardware clock"
hwclock --systohc --utc

# TODO - optional - set any required kernel modules here

# Set host name
echo "Setting host name"
echo "archvb" > /etc/hostname

# Configure the netwotk
#	Check exact interface name (e.g. enp0s3)
#	ip link
# Wired, dynamic IP, using dhcpcd
echo "Configuring network"
systemctl enable dhcpcd@enp0s3.service

# TODO - optional - create initial ramdisk environment (check arch wiki for details)

# Install and configure a bootloader (Syslinux is chosen here)
echo "Installing bootloader"
pacman -S syslinux --noconfirm
echo "Configuring bootloader"
syslinux-install_update -i -a -m
# Verify that used partitions are correct (usually there is a need for adjustments)
#vi /boot/syslinux/syslinux.cfg
sed -i 's/sda3/sda2/g' /boot/syslinux/syslinux.cfg

# Set root password
echo "Setting root password"
#passwd
repeatUntilSuccess "passwd" 5 || echo -e "\nERROR: password not changed\n"

# Add regular user
echo "Adding regular user"
useradd -m -g users -G wheel,storage,power -s /bin/bash adam

# Set password
echo "Setting password for regular user"
#passwd adam
repeatUntilSuccess "passwd adam" 3 || echo -e "\nERROR: password unchanged\n"

echo "Adding user to sudoers"
# TODO - do it in a safer way... Here just for experiments
echo "adam ALL=(ALL) ALL" >> /etc/sudoers

echo "Ending chrooted.sh"

