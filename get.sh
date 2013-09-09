#!/bin/bash

# Source repository
REPOSITORY="https://raw.github.com/lypant/archconfig/modular"

# Destination directory
DST_DIR="/root"

# Files to be downloaded as first
SETTINGS_FILE="settings.conf"
FUNCTIONS_FILE="utils/functions.sh"
DOWNLOAD_FILE="utils/download.sh"

# Source paths
SETTINGS_SRC="$REPOSITORY/$SETTINGS_FILE"
FUNCTIONS_SRC="$REPOSITORY/$FUNCTIONS_FILE"
DOWNLOAD_SRC="$REPOSITORY/$DOWNLOAD_FILE"

# Destination paths
SETTINGS_DST="$DST_DIR/$SETTINGS_FILE"
FUNCTIONS_DST="$DST_DIR/$FUNCTIONS_FILE"
DOWNLOAD_DST="$DST_DIR/$DOWNLOADS_FILE"

# Download basic files 
curl -o "$SETTINGS_DST" -fsL "$SETTINGS_SRC"
curl -o "$FUNCTIONS_DST" -fsL "$FUNCTIONS_SRC"
curl -o "$DOWNLOAD_DST" -fsL "$DOWNLOAD_SRC"

# Load settings
source "$SETTINGS_DST"

# Load functions
source "$FUNCTIONS_DST"

# Download other files by loading download script
source "$DOWNLOAD_DST" "$DST_DIR"

