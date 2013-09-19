#!/bin/bash

# Load settings
source "settings.conf"
source "$FUNCTIONS_FILE" "$INSTALL_SCRIPT_LOG_FILE"

# Launch all installation scripts from here

# Disk preparation
executeScript "$PARTITION_DISKS_FILE"
executeScript "$CREATE_FILE_SYSTEMS_FILE"
executeScript "$MOUNT_PARTITIONS_FILE"

# Pacman-related
executeScript "$UPDATE_ISO_PACMAN_FILE"
executeScript "$RANK_MIRRORS_FILE"

# Base system installation
executeScript "$INSTALL_BASE_SYSTEM_FILE"

# Fstab
executeScript "$GENERATE_FSTAB_FILE"

#mkdir "$MOUNTED_ARCHCONFIG_PATH"
#source "$DOWNLOAD_FILE" "$MOUNTED_ARCHCONFIG_PATH"
#chmod +x "$MOUNTED_CHROOT_FILE"
#arch-chroot "$MOUNT_PATH" "$CHROOTED_CHROOT_FILE"

## Set rights of all archconfig files
#chmod -R +rx "$MOUNTED_ARCHCONFIG_PATH"

executeCommand "mkdir \"$MOUNTED_ARCHCONFIG_PATH\""
executeScript "$DOWNLOAD_FILE" "$MOUNTED_ARCHCONFIG_PATH"
executeCommand "chmod +x \"$MOUNTED_CHROOT_FILE\""
executeCommand "arch-chroot \"$MOUNT_PATH\" \"$CHROOTED_CHROOT_FILE\""

# Set rights of all archconfig files
executeCommand "chmod -R +rx \"$MOUNTED_ARCHCONFIG_PATH\""


executeScript "$UNMOUNT_PARTITIONS_FILE"

