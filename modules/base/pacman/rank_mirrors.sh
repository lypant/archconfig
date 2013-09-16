#!/bin/bash

# Select a mirror
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.original
rankmirrors -n "$MIRROR_COUNT" /etc/pacman.d/mirrorlist.original > /etc/pacman.d/mirrorlist

