#!/bin/bash

echo "Starting download_scripts.sh"

DEST_DIR=$1
echo "Downloading scripts to $DEST_DIR"

downloadFile "$REPOSITORY/archconfig.sh" "$DEST_DIR/archconfig.sh"
downloadFile "$REPOSITORY/settings.conf" "$DEST_DIR/settings.conf"
downloadFile "$REPOSITORY/functions.sh" "$DEST_DIR/functions.sh"
downloadFile "$REPOSITORY/install.sh" "$DEST_DIR/install.sh"
downloadFile "$REPOSITORY/partition_disk.sh" "$DEST_DIR/partition_disk.sh"
downloadFile "$REPOSITORY/base_system.sh" "$DEST_DIR/base_system.sh"
downloadFile "$REPOSITORY/chrooted.sh" "$DEST_DIR/chrooted.sh"
downloadFile "$REPOSITORY/post_chroot.sh" "$DEST_DIR/post_chroot.sh"
downloadFile "$REPOSITORY/customisation.sh" "$DEST_DIR/customisation.sh"

chmod +x "$DEST_DIR/archconfig.sh"
chmod +x "$DEST_DIR/settings.conf"
chmod +x "$DEST_DIR/functions.sh"
chmod +x "$DEST_DIR/install.sh"
chmod +x "$DEST_DIR/partition_disk.sh"
chmod +x "$DEST_DIR/base_system.sh"
chmod +x "$DEST_DIR/chrooted.sh"
chmod +x "$DEST_DIR/post_chroot.sh"
chmod +x "$DEST_DIR/customisation.sh"

echo "Ending download_scripts.sh"
