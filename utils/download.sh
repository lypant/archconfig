#!/bin/bash

DST_DIR=$1

# Destination paths
GET_DST="$DST_DIR/$GET_FILE"
INSTALL_DST="$DST_DIR/$INSTALL_FILE"

# Main directory
downloadFile "$REPOSITORY/$GET_FILE" "$GET_DST"
downloadFile "$REPOSITORY/$SETTINGS_FILE" "$DST_DIR/$SETTINGS_FILE"
downloadFile "$REPOSITORY/$INSTALL_FILE" "$INSTALL_DST"

# Utils
downloadFile "$REPOSITORY/$FUNCTIONS_FILE" "$DST_DIR/$FUNCTIONS_FILE"
# TODO: Download itself? Wouldn't it be a problem during execution of that script? Should not - no overwrite flag.
downloadFile "$REPOSITORY/$DOWNLOAD_FILE" "$DST_DIR/$DOWNLOAD_FILE"

# Base

# Disk
downloadFile "$REPOSITORY/$PARTITION_DISKS_FILE" "$DST_DIR/$PARTITION_DISKS_FILE"
downloadFile "$REPOSITORY/$CREATE_FILE_SYSTEMS_FILE" "$DST_DIR/$CREATE_FILE_SYSTEMS_FILE"
downloadFile "$REPOSITORY/$MOUNT_PARTITIONS_FILE" "$DST_DIR/$MOUNT_PARTITIONS_FILE"

# Pacman
downloadFile "$REPOSITORY/$UPDATE_ISO_PACMAN_FILE" "$DST_DIR/$UPDATE_ISO_PACMAN_FILE"
downloadFile "$REPOSITORY/$RANK_MIRRORS_FILE" "$DST_DIR/$RANK_MIRRORS_FILE"

# System
downloadFile "$REPOSITORY/$INSTALL_BASE_SYSTEM_FILE" "$DST_DIR/$INSTALL_BASE_SYSTEM_FILE"

# Fstab
downloadFile "$REPOSITORY/$GENERATE_FSTAB_FILE" "$DST_DIR/$GENERATE_FSTAB_FILE"

# Chroot
downloadFile "$REPOSITORY/$CHROOT_FILE" "$DST_DIR/$CHROOT_FILE"

# Change permissions - only needed for user-launched scripts
chmod +x "$GET_DST"
chmod +x "$INSTALL_DST"

