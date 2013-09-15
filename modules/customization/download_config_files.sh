#!/bin/bash

# TODO: Download all files in download.sh; here just copy them

downloadFileSudo "$REPOSITORY/files/virtualbox.conf" "/etc/modules-load.d/virtualbox.conf" "--overwrite"
downloadFileSudo "$REPOSITORY/files/issue" "/etc/issue" "--overwrite"

downloadFile "$REPOSITORY/files/dotfiles/.bash_profile" "/home/adam/.bash_profile" "--overwrite"
downloadFile "$REPOSITORY/files/dotfiles/.bashrc" "/home/adam/.bashrc" "--overwrite"
downloadFile "$REPOSITORY/files/dotfiles/.gitconfig" "/home/adam/.gitconfig" "--overwrite"
downloadFile "$REPOSITORY/files/dotfiles/.vim/colors/solarized.vim" "/home/adam/.vim/colors/solarized.vim" "--overwrite"
downloadFile "$REPOSITORY/files/dotfiles/.vimrc" "/home/adam/.vimrc" "--overwrite"
downloadFile "$REPOSITORY/files/dotfiles/.Xdefaults" "/home/adam/.Xdefaults" "--overwrite"
downloadFile "$REPOSITORY/files/dotfiles/.xinitrc" "/home/adam/.xinitrc" "--overwrite"

