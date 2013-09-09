#!/bin/bash

# Select a mirror
echo Ranking pacman mirrors - this can take a while
cp /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist.original
rankmirrors -n 5 /etc/pacman.d/mirrorlist.original > /etc/pacman.d/mirrorlist

