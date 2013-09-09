#!/bin/bash

# Create file systems
echo Creating file systems
mkswap /dev/sda1
swapon /dev/sda1
mkfs.ext4 /dev/sda2

