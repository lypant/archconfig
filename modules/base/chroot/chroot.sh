#!/bin/bash

# Hardcoded path needed - first include
source "/etc/archconfig/settings.conf"

source "$CHROOTED_FUNCTIONS_FILE"

# Host name
source "$SET_HOST_NAME_FILE"

# Localization

# Set locales
source "$SET_LOCALES_FILE"

# Generate locales
source "$GENERATE_LOCALES_FILE"

# Set language
source "$SET_LANGUAGE_FILE"

# Set time zone
source "$SET_TIME_ZONE_FILE"

# Set hw clock
source "$SET_HW_CLOCK_FILE"

# Console

# Set console keymap
source "$SET_CONSOLE_KEYMAP_FILE"

# Set console font
source "$SET_CONSOLE_FONT_FILE"

# Network

# Configure network
source "$CONFIGURE_NETWORK_FILE"

# Bootloader

# Install bootloader
source "$INSTALL_BOOTLOADER_FILE"

# Configure bootloader
source "$CONFIGURE_BOOTLOADER_FILE"

# Users

# Set root password
source "$SET_ROOT_PASSWORD_FILE"

# Add regular user
source "$ADD_REGULAR_USER_FILE"

# Set regular user password
source "$SET_REGULAR_USER_PASSWORD_FILE"

# Set sudoers
source "$SET_SUDOERS_FILE"

