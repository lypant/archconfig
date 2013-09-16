#!/bin/bash

source "/etc/archconfig/settings.conf"
source "$ARCHCONFIG_PATH/$FUNCTIONS_FILE"

source "$ARCHCONFIG_PATH/$UPDATE_PACKAGE_LIST_FILE"
source "$ARCHCONFIG_PATH/$CONFIGURE_PACMAN_FILE"
source "$ARCHCONFIG_PATH/$INSTALL_PACKAGES_FILE"
source "$ARCHCONFIG_PATH/$LOAD_GUEST_MODULES_FILE"
source "$ARCHCONFIG_PATH/$COPY_CONFIG_FILES_FILE"
source "$ARCHCONFIG_PATH/$INSTALL_DWM_FILE"
source "$ARCHCONFIG_PATH/$SET_TERMINAL_VIDEO_MODE_FILE"
source "$ARCHCONFIG_PATH/$DISABLE_SYSLINUX_MENU_FILE"
source "$ARCHCONFIG_PATH/$SET_EARLY_TERMINAL_FONT_FILE"
source "$ARCHCONFIG_PATH/$RECREATE_IMAGE_FILE"

