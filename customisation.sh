#!/bin/bash

SCRIPTS_PATH="/etc/archconfig"

source "$SCRIPTS_PATH/settings.conf"
source "$SCRIPTS_PATH/functions.sh"

echo "Starting customisation.sh"

echo "Updating package list"
pacman -Syy

echo "Configuring pacman"
uncommentVar "TotalDownload" /etc/pacman.conf

echo "Installing packets"
pacman -S --noconfirm vim alsa-utils xorg-server xorg-server-utils xorg-xinit mesa virtualbox-guest-utils dmenu rxvt-unicode ttf-inconsolata ttf-dejavu git

echo "Loading guest addition modules"
modprobe -a vboxguest vboxsf vboxvideo

echo "Downloading config files" 
downloadFile "$REPOSITORY/files/virtualbox.conf" "/etc/modules-load.d/virtualbox.conf" "--overwrite"
downloadFile "$REPOSITORY/files/issue" "/etc/issue" "--overwrite"

downloadFile "$REPOSITORY/files/dotfiles/.bash_profile" "/home/adam/.bash_profile" "--overwrite"
downloadFile "$REPOSITORY/files/dotfiles/.bashrc" "/home/adam/.bashrc" "--overwrite"
downloadFile "$REPOSITORY/files/dotfiles/.gitconfig" "/home/adam/.gitconfig" "--overwrite"
downloadFile "$REPOSITORY/files/dotfiles/.vim/colors/solarized.vim" "/home/adam/.vim/colors/solarized.vim" "--overwrite"
downloadFile "$REPOSITORY/files/dotfiles/.vimrc" "/home/adam/.vimrc" "--overwrite"
downloadFile "$REPOSITORY/files/dotfiles/.Xdefaults" "/home/adam/.Xdefaults" "--overwrite"
downloadFile "$REPOSITORY/files/dotfiles/.xinitrc" "/home/adam/.xinitrc" "--overwrite"

echo "Setting dir and file ownership"
chown "adam:users" "/etc/modules-load.d/virtualbox.conf"
chown "adam:users" "/home/adam/.bash_profile"
chown "adam:users" "/home/adam/.bashrc"
chown "adam:users" "/home/adam/.gitconfig"
chown "adam:users" "/home/adam/.vim"
chown "adam:users" "/home/adam/.vim/colors/solarized.vim"
chown "adam:users" "/home/adam/.vimrc"
chown "adam:users" "/home/adam/.Xdefaults"
chown "adam:users" "/home/adam/.xinitrc"



echo "Installing dwm"
DWM_BUILD_PATH="/home/adam/build/dwm"
git clone http://git.suckless.org/dwm "$DWM_BUILD_PATH"
chown "adam:users" "$DWM_BUILD_PATH"
cd $DWM_BUILD_PATH
git checkout 4fb31e0 -b my_adjustments
sed -i 's/PREFIX = \/usr\/local/PREFIX = \/usr/g' "$DWM_BUILD_PATH/config.mk"
sed -i 's/X11INC = \/usr\/X11R6\/include/X11INC = \/usr\/include\/X11/g' "$DWM_BUILD_PATH/config.mk"
sed -i 's/X11LIB = \/usr\/X11R6\/lib/X11LIB = \/usr\/lib\/X11/g' "$DWM_BUILD_PATH/config.mk"
sed -i 's/"st"/"urxvt"/g' "$DWM_BUILD_PATH/config.def.h"
git commit -a -m "My adjustments"
make clean install
 
# Custom video mode for terminal (1680x1050) - requires VBox setup at the beginning
# Quiet mode - no logs during bootup
# TODO - think about copying ready config files instead of sedding some settings like this one
echo "Setting custom video mode for terminal"
sed -i 's/APPEND root=\/dev\/sda2 rw/APPEND root=\/dev\/sda2 rw vga=864 quiet/' /boot/syslinux/syslinux.cfg

# Disable syslinux menu (automatic boot)
echo "Disabling syslinux menu"
commentVar UI /boot/syslinux/syslinux.cfg

# Early terminal font
# TODO Replace with function adding new values to the list
echo "Setting early terminal font"
sed -i 's/HOOKS="base udev autodetect modconf block filesystems keyboard fsck"/HOOKS="base udev autodetect modconf block filesystems keyboard fsck consolefont keymap"/g' /etc/mkinitcpio.conf

# Recreate the image
echo "Recreating the image"
mkinitcpio -p linux

echo "Ending customisation.sh"

