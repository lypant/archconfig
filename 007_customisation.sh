# Update package list
sudo pacman -Syy

# Install git
sudo pacman -S --noconfirm git

# Configure pacman
# Display total download progress
sudo sed -i 's/#TotalDownload/TotalDownload/g' /etc/pacman.conf

# Install packets
sudo pacman -S --noconfirm vim alsa-utils xorg-server xorg-server-utils xorg-xinit mesa virtualbox-guest-utils dmenu rxvt-unicode ttf-inconsolata ttf-dejavu

# Manually load the modules
sudo modprobe -a vboxguest vboxsf vboxvideo

# Create config file with modules to be loaded
sudo cp /etc/archconfig/files/virtualbox.conf /etc/modules-load.d/

# Copy the dotfiles
cp /etc/archconfig/dotfiles/.* ~
cp -r /etc/archconfig/dotfiles/.vim ~

# Get, make and install dwm
# TODO Use variables for paths
git clone http://git.suckless.org/dwm ~/build/dwm
cd ~/build/dwm
git checkout 4fb31e0 -b my_adjustments
sed -i 's/PREFIX = \/usr\/local/PREFIX = \/usr/g' ~/build/dwm/config.mk
sed -i 's/X11INC = \/usr\/X11R6\/include/X11INC = \/usr\/include\/X11/g' ~/build/dwm/config.mk
sed -i 's/X11LIB = \/usr\/X11R6\/lib/X11LIB = \/usr\/lib\/X11/g' ~/build/dwm/.config.mk
sed -i 's/"st"/"urxvt"/g' ~/build/dwm/config.def.h
git commit -a -m "My adjustments"
sudo make clean install

