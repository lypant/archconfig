#!/bin/bash

# Repository settings

REPOSITORY="https://raw.github.com/lypant/archconfig/experiments"

# Download basic files 
curl -o "/root/settings.conf" -fsL "$REPOSITORY/settings.conf"
curl -o "/root/functions.sh" -fsL "$REPOSITORY/functions.sh"
curl -o "/root/download_scripts.sh" -fsL "$REPOSITORY/download_scripts.sh"

# Load settings
source settings.conf

# Set font for livecd
setfont $CONSOLE_FONT

# Load functions
source functions.sh

# Load other scripts
source download_scripts.sh "/root"

# Start executing scripts
source install.sh

echo "Reboot, log in as a regular user and launch /etc/archconfig/customisation.sh"

