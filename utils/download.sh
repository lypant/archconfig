#!/bin/bash

DST_DIR=$1

# Destination paths - only for user-launchable scripts
GET_DST="$DST_DIR/$GET_FILE"
INSTALL_DST="$DST_DIR/$INSTALL_FILE"
CUSTOMIZE_DST="$DST_DIR/$CUSTOMIZE_FILE"

# Main directory
downloadFile "$REPOSITORY/$GET_FILE" "$GET_DST"
downloadFile "$REPOSITORY/$SETTINGS_FILE" "$DST_DIR/$SETTINGS_FILE"
downloadFile "$REPOSITORY/$INSTALL_FILE" "$INSTALL_DST"
downloadFile "$REPOSITORY/$CUSTOMIZE_FILE" "$CUSTOMIZE_DST"

# Utils
downloadFile "$REPOSITORY/$FUNCTIONS_FILE" "$DST_DIR/$FUNCTIONS_FILE"
downloadFile "$REPOSITORY/$DOWNLOAD_FILE" "$DST_DIR/$DOWNLOAD_FILE"

# Base

# Disk
downloadFile "$REPOSITORY/$PARTITION_DISKS_FILE" "$DST_DIR/$PARTITION_DISKS_FILE"
downloadFile "$REPOSITORY/$CREATE_FILE_SYSTEMS_FILE" "$DST_DIR/$CREATE_FILE_SYSTEMS_FILE"
downloadFile "$REPOSITORY/$MOUNT_PARTITIONS_FILE" "$DST_DIR/$MOUNT_PARTITIONS_FILE"
downloadFile "$REPOSITORY/$UNMOUNT_PARTITIONS_FILE" "$DST_DIR/$UNMOUNT_PARTITIONS_FILE"

# Pacman
downloadFile "$REPOSITORY/$UPDATE_ISO_PACMAN_FILE" "$DST_DIR/$UPDATE_ISO_PACMAN_FILE"
downloadFile "$REPOSITORY/$RANK_MIRRORS_FILE" "$DST_DIR/$RANK_MIRRORS_FILE"

# System
downloadFile "$REPOSITORY/$INSTALL_BASE_SYSTEM_FILE" "$DST_DIR/$INSTALL_BASE_SYSTEM_FILE"

# Fstab
downloadFile "$REPOSITORY/$GENERATE_FSTAB_FILE" "$DST_DIR/$GENERATE_FSTAB_FILE"

# Chroot

# Chroot
downloadFile "$REPOSITORY/$CHROOT_FILE" "$DST_DIR/$CHROOT_FILE"

# Host name
downloadFile "$REPOSITORY/$SET_HOST_NAME_FILE" "$DST_DIR/$SET_HOST_NAME_FILE"

# Localization

# Set locales
downloadFile "$REPOSITORY/$SET_LOCALES_FILE" "$DST_DIR/$SET_LOCALES_FILE"

# Generate locales
downloadFile "$REPOSITORY/$GENERATE_LOCALES_FILE" "$DST_DIR/$GENERATE_LOCALES_FILE"

# Set language
downloadFile "$REPOSITORY/$SET_LANGUAGE_FILE" "$DST_DIR/$SET_LANGUAGE_FILE"

# Set time zone
downloadFile "$REPOSITORY/$SET_TIME_ZONE_FILE" "$DST_DIR/$SET_TIME_ZONE_FILE"

# Set hw clock
downloadFile "$REPOSITORY/$SET_HW_CLOCK_FILE" "$DST_DIR/$SET_HW_CLOCK_FILE"

# Console

# Set console keymap
downloadFile "$REPOSITORY/$SET_CONSOLE_KEYMAP_FILE" "$DST_DIR/$SET_CONSOLE_KEYMAP_FILE"

# Set console font
downloadFile "$REPOSITORY/$SET_CONSOLE_FONT_FILE" "$DST_DIR/$SET_CONSOLE_FONT_FILE"

# Network

# Configure network
downloadFile "$REPOSITORY/$CONFIGURE_NETWORK_FILE" "$DST_DIR/$CONFIGURE_NETWORK_FILE"

# Bootloader

# Install bootloader
downloadFile "$REPOSITORY/$INSTALL_BOOTLOADER_FILE" "$DST_DIR/$INSTALL_BOOTLOADER_FILE"

# Configure bootloader
downloadFile "$REPOSITORY/$CONFIGURE_BOOTLOADER_FILE" "$DST_DIR/$CONFIGURE_BOOTLOADER_FILE"

# Users

# Set root password
downloadFile "$REPOSITORY/$SET_ROOT_PASSWORD_FILE" "$DST_DIR/$SET_ROOT_PASSWORD_FILE"

# Add regular user
downloadFile "$REPOSITORY/$ADD_REGULAR_USER_FILE" "$DST_DIR/$ADD_REGULAR_USER_FILE"

# Set regular user password
downloadFile "$REPOSITORY/$SET_REGULAR_USER_PASSWORD_FILE" "$DST_DIR/$SET_REGULAR_USER_PASSWORD_FILE"

# Set sudoers
downloadFile "$REPOSITORY/$SET_SUDOERS_FILE" "$DST_DIR/$SET_SUDOERS_FILE"

# Customization

# Update package list
downloadFile "$REPOSITORY/$UPDATE_PACKAGE_LIST_FILE" "$DST_DIR/$UPDATE_PACKAGE_LIST_FILE"
downloadFile "$REPOSITORY/$CONFIGURE_PACMAN_FILE" "$DST_DIR/$CONFIGURE_PACMAN_FILE"
downloadFile "$REPOSITORY/$INSTALL_PACKAGES_FILE" "$DST_DIR/$INSTALL_PACKAGES_FILE"
downloadFile "$REPOSITORY/$LOAD_GUEST_MODULES_FILE" "$DST_DIR/$LOAD_GUEST_MODULES_FILE"
downloadFile "$REPOSITORY/$DOWNLOAD_CONFIG_FILES_FILE" "$DST_DIR/$DOWNLOAD_CONFIG_FILES_FILE"
downloadFile "$REPOSITORY/$INSTALL_DWM_FILE" "$DST_DIR/$INSTALL_DWM_FILE"
downloadFile "$REPOSITORY/$SET_TERMINAL_VIDEO_MODE_FILE" "$DST_DIR/$SET_TERMINAL_VIDEO_MODE_FILE"
downloadFile "$REPOSITORY/$DISABLE_SYSLINUX_MENU_FILE" "$DST_DIR/$DISABLE_SYSLINUX_MENU_FILE"
downloadFile "$REPOSITORY/$SET_EARLY_TERMINAL_FONT_FILE" "$DST_DIR/$SET_EARLY_TERMINAL_FONT_FILE"
downloadFile "$REPOSITORY/$RECREATE_IMAGE_FILE" "$DST_DIR/$RECREATE_IMAGE_FILE"

# Change permissions - only needed for user-launched scripts
chmod +x "$GET_DST"
chmod +x "$INSTALL_DST"
chmod +x "$CUSTOMIZE_DST"

