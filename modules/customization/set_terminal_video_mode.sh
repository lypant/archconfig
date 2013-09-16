#!/bin/bash

sudo sed -i "s/APPEND root=\/dev\/$ROOT_PARTITION rw/APPEND root=\/dev\/$ROOT_PARTITION $BOOTLOADER_KERNEL_PARAMS/" /boot/syslinux/syslinux.cfg

