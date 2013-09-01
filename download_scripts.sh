#!/bin/bash

echo "Starting download_scripts.sh"

DEST_DIR=$1
echo "Downloading scripts to $DEST_DIR"

downloadFile "$REPOSITORY/archconfig.sh" "$DEST_DIR/archconfig.sh"
downloadFile "$REPOSITORY/functions.sh" "$DEST_DIR/functions.sh"
downloadFile "$REPOSITORY/install.sh" "$DEST_DIR/install.sh"
downloadFile "$REPOSITORY/partition_disk.sh" "$DEST_DIR/partition_disk.sh"
downloadFile "$REPOSITORY/base_system.sh" "$DEST_DIR/base_system.sh"
downloadFile "$REPOSITORY/chrooted.sh" "$DEST_DIR/chrooted.sh"
downloadFile "$REPOSITORY/post_chroot.sh" "$DEST_DIR/post_chroot.sh"
downloadFile "$REPOSITORY/customisation.sh" "$DEST_DIR/customisation.sh"

echo "Ending download_scripts.sh"
