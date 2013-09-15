#!/bin/bash

sudo sed -i 's/APPEND root=\/dev\/sda2 rw/APPEND root=\/dev\/sda2 rw vga=864 quiet/' /boot/syslinux/syslinux.cfg

