#!/bin/bash

syslinux-install_update -i -a -m
# Verify that used partitions are correct (usually there is a need for adjustments)
#vi /boot/syslinux/syslinux.cfg
sed -i 's/sda3/sda2/g' /boot/syslinux/syslinux.cfg

