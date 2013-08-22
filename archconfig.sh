#!/bin/bash

# Main configuration and installation script

# Boot Arch LiveCD and launch following command:
# curl https://raw.github.com/lypant/archconfig/automated/archconfig.sh > archconfig.sh
#
# Edit archconfig.sh settings if necessary and then run
# bash archconfig.sh

REPOSITORY=https://raw.github.com/lypant/archconfig/automated

USERNAME=adam

# Install
. <(curl -fsL "${REPOSITORY}/install.sh"); echo "Tra la la!"

