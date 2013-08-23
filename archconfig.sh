#!/bin/bash

# Repository settings

REPOSITORY="https://raw.github.com/lypant/archconfig/experiments"

# System settings

HDD="/dev/sda"
SWAP_SIZE="+1G"
ROOT_SIZE="\n"	# Remaining space

# First download script containing helper functions
curl -o "functions.sh" -fsL "$REPOSITORY/functions.sh"

# Load that script
source functions.sh

# Load other scripts
downloadFile "$REPOSITORY/install.sh" "install.sh"
downloadFile "$REPOSITORY/partition_disk.sh" "partition_disk.sh"

# Start executing scripts
source install.sh

