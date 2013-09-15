#!/bin/bash

sudo sed -i 's/HOOKS="base udev autodetect modconf block filesystems keyboard fsck"/HOOKS="base udev autodetect modconf block filesystems keyboard fsck consolefont keymap"/g' /etc/mkinitcpio.conf

# TODO - this requires image recreation

