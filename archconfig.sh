#!/bin/bash

# Repository settings

REPOSITORY="https://raw.github.com/lypant/archconfig/experiments"

# System settings

HDD="/dev/sda"
SWAP_SIZE="+1G"
ROOT_SIZE=""	# Remaining space

# First download script containing helper functions
curl -o "/root/functions.sh" -fsL "$REPOSITORY/functions.sh"
curl -o "/root/download_scripts.sh" -fsL "$REPOSITORY/download_scripts.sh"

# Load that script
source functions.sh

# Load other scripts
source download_scripts.sh "/root"

# Start executing scripts
source install.sh

