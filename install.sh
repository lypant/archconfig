#!/bin/bash

# Main installation script.
# Launched by archconfig.sh

echo "Hello, " $USERNAME

echo Prepare HDD...
executeScript "${DISK_PREPARATION_SCRIPT}"

