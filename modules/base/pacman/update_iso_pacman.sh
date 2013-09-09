#!/bin/bash

# Update livecd pacman
echo Update pacman on live cd
uncommentVar "TotalDownload" /etc/pacman.conf
pacman -Syy

