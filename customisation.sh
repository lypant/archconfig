#!/bin/bash

source functions.sh

echo "Starting customisation.sh"

echo "Updating package list"
sudo pacman -Syy

echo "Configuring pacman"
sudo uncommentVar "TotalDownload" /etc/pacman.conf

echo "Installing packets"
sudo pacman -S --noconfirm vim alsa-utils xorg-server xorg-server-utils xorg-xinit mesa virtualbox-guest-utims dmenu rxvt-unicode ttf-inconsolata ttf-dejavu git

echo "Loading guest addition modules"
sudo modprobe -a vboxguest vboxsf vboxvideo

echo "Downloading config files" 
sudo downloadFile "$REPOSITORY/files/virtualbox.conf" "/etc/modules-load.d/virtualbox.conf"
sudo downloadFile "$REPOSITORY/files/issue" "/etc/issue"

downloadFile "$REPOSITORY/files/dotfiles/.bash_profile" "/home/adam/.bash_profile"
downloadFile "$REPOSITORY/files/dotfiles/.bashrc" "/home/adam/.bashrc"
downloadFile "$REPOSITORY/files/dotfiles/.gitconfig" "/home/adam/.gitconfig"
downloadFile "$REPOSITORY/files/dotfiles/.vim/colors/solarized.vim" "/home/adam/.vim/colors/solarized.vim"
downloadFile "$REPOSITORY/files/dotfiles/.vimrc" "/home/adam/.vimrc"
downloadFile "$REPOSITORY/files/dotfiles/.Xdefaults" "/home/adam/.Xdefaults"
downloadFile "$REPOSITORY/files/dotfiles/.xinitrc" "/home/adam/.xinitrc"

echo "Installing dwm"
DWM_BUILD_PATH="/home/adam/build/dwm"
git clone http://git.suckless.org/dwm "$DWM_BUILD_PATH"
cd $DWM_BUILD_PATH
git checkout 4fb31e0 -b my_adjustments
sed -i 's/PREFIX = \/usr\/local/PREFIX = \/usr/g' "$DWM_BUILD_PATH/config.mk"
sed -i 's/X11INC = \/usr\/X11R6\/include/X11INC = \/usr\/include\/X11/g' "$DWM_BUILD_PATH/config.mk"
sed -i 's/X11LIB = \/usr\/X11R6\/lib/X11LIB = \/usr\/lib\/X11/g' "$DWM_BUILD_PATH/config.mk"
sed -i 's/"st"/"urxvt"/g' "$DWM_BUILD_PATH/config.def.h"
git commit -a -m "My adjustments"
sudo make clean install
 
# Custom video mode for terminal (1680x1050) - requires VBox setup at the beginning
# Quiet mode - no logs during bootup
# TODO - think about copying ready config files instead of sedding some settings like this one
echo "Setting custom video mode for terminal"
sudo sed -i 's/APPEND root=\/dev\/sda2 rw/APPEND root=\/dev\/sda2 rw vga=864 quiet/' /boot/syslinux/syslinux.cfg

# Disable syslinux menu (automatic boot)
echo "Disabling syslinux menu"
sudo commentVar UI /boot/syslinux/syslinux.cfg

# Early terminal font
# TODO Replace with function adding new values to the list
echo "Setting early terminal font"
sudo sed -i 's/HOOKS="base udev autodetect modconf block filesystems keyboard fsck"/HOOKS="base ud    ev autodetect modconf block filesystems keyboard fsck consolefont keymap"/g' /etc/mkinitcpio.conf

# Recreate the image
echo "Recreating the image"
sudo mkinitcpio -p linux

echo "Ending customisation.sh"

