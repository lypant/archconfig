#!/bin/bash

# Hardcoded path needed - first include
source "/etc/archconfig/settings.conf"

source "$CHROOTED_FUNCTIONS_FILE"

# Set locales

# Generate locales

# Set language

# Optional? - Console keymap and font
# TODO - replace with favourite font when such is found
# TODO - think about setting necessary kernel params/switches etc to allow smooth initialization
# KEYMAP=pl
# FONT=Lat2-Terminus16

# Set time zone

# Set hardware clock

# TODO - optional - set any required kernel modules here

# Set host name

# Configure the netwotk
#	Check exact interface name (e.g. enp0s3)
#	ip link
# Wired, dynamic IP, using dhcpcd

# TODO - optional - create initial ramdisk environment (check arch wiki for details)

# Install and configure a bootloader (Syslinux is chosen here)

# Set root password

# Add regular user

# Set password

# "Adding user to sudoers"

