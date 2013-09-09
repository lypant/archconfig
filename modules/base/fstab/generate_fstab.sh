#!/bin/bash

# Generate fstab (-L is for labels, -U is for UIDs)
echo Generating fstab
genfstab -L -p /mnt >> /mnt/etc/fstab

