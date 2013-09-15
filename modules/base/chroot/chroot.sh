#!/bin/bash

# Hardcoded path needed - first include
source "/etc/archconfig/settings.conf"

source "$CHROOTED_FUNCTIONS_FILE"

# Host name
source "$ARCHCONFIG_PATH/$SET_HOST_NAME_FILE"

# Localization

# Set locales
source "$ARCHCONFIG_PATH/$SET_LOCALES_FILE"

# Generate locales
source "$ARCHCONFIG_PATH/$GENERATE_LOCALES_FILE"

# Set language
source "$ARCHCONFIG_PATH/$SET_LANGUAGE_FILE"

# Set time zone
source "$ARCHCONFIG_PATH/$SET_TIME_ZONE_FILE"

# Set hw clock
source "$ARCHCONFIG_PATH/$SET_HW_CLOCK_FILE"

# Console

# Set console keymap
source "$ARCHCONFIG_PATH/$SET_CONSOLE_KEYMAP_FILE"

# Set console font
source "$ARCHCONFIG_PATH/$SET_CONSOLE_FONT_FILE"

# Network

# Configure network
source "$ARCHCONFIG_PATH/$CONFIGURE_NETWORK_FILE"

# Bootloader

# Install bootloader
source "$ARCHCONFIG_PATH/$INSTALL_BOOTLOADER_FILE"

# Configure bootloader
source "$ARCHCONFIG_PATH/$CONFIGURE_BOOTLOADER_FILE"

# Users

# Set root password
source "$ARCHCONFIG_PATH/$SET_ROOT_PASSWORD_FILE"

# Add regular user
source "$ARCHCONFIG_PATH/$ADD_REGULAR_USER_FILE"

# Set regular user password
source "$ARCHCONFIG_PATH/$SET_REGULAR_USER_PASSWORD_FILE"

# Set sudoers
source "$ARCHCONFIG_PATH/$SET_SUDOERS_FILE"

