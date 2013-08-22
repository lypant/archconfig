#!/bin/bash

# Main configuration and installation script

# Boot Arch LiveCD and launch following command:
# curl https://raw.github.com/lypant/archconfig/automated/archconfig.sh > archconfig.sh
#
# Edit archconfig.sh settings if necessary and then run
# bash archconfig.sh

# REPOSITORY CONFIGURATION

REPOSITORY=https://raw.github.com/lypant/archconfig/automated
INSTALL_SCRIPT=/install.sh
DISK_PREPARATION_SCRIPT=/prepare_disk.sh

# DISK SETUP

HDD=/dev/sda
SWAP_PARTITION_SIZE=1G
ROOT_PARTITION_SIZE=remaining


USERNAME=adam

# Install
. <(curl -fsL "${REPOSITORY}${INSTALL_SCRIPT}"); echo "Tra la la!"

