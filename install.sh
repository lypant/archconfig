#!/bin/bash

# Load settings
source "settings.conf"
source "$FUNCTIONS_FILE"

# Launch all installation scripts from here

# Disk preparation
source "$PARTITION_DISKS_FILE"
source "$CREATE_FILE_SYSTEMS_FILE"
source "$MOUNT_PARTITIONS_FILE"

# Pacman-related
source "$UPDATE_ISO_PACMAN_FILE"
source "$RANK_MIRRORS_FILE"

# Base system installation
source "$INSTALL_BASE_SYSTEM_FILE"

# Fstab
source "$GENERATE_FSTAB_FILE"

mkdir "$MOUNTED_ARCHCONFIG_PATH"
source "$DOWNLOAD_FILE" "$MOUNTED_ARCHCONFIG_PATH"
chmod +x "$MOUNTED_CHROOT_FILE"
arch-chroot "$MOUNT_PATH" "$CHROOTED_CHROOT_FILE"

# Set rights of all archconfig files
chmod -R +rx "$MOUNTED_ARCHCONFIG_PATH"

source "$UNMOUNT_PARTITIONS_FILE"

