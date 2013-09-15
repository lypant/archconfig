#!/bin/bash

# TODO: Download all files in download.sh; here just copy them

downloadFileSudo "$REPOSITORY/modules/files/virtualbox.conf" "/etc/modules-load.d/virtualbox.conf" "--overwrite"
downloadFileSudo "$REPOSITORY/modules/files/issue" "/etc/issue" "--overwrite"

downloadFile "$REPOSITORY/modules/files/dotfiles/.bash_profile" "/home/adam/.bash_profile" "--overwrite"
downloadFile "$REPOSITORY/modules/files/dotfiles/.bashrc" "/home/adam/.bashrc" "--overwrite"
downloadFile "$REPOSITORY/modules/files/dotfiles/.gitconfig" "/home/adam/.gitconfig" "--overwrite"
downloadFile "$REPOSITORY/modules/files/dotfiles/.vim/colors/solarized.vim" "/home/adam/.vim/colors/solarized.vim" "--overwrite"
downloadFile "$REPOSITORY/modules/files/dotfiles/.vimrc" "/home/adam/.vimrc" "--overwrite"
downloadFile "$REPOSITORY/modules/files/dotfiles/.Xdefaults" "/home/adam/.Xdefaults" "--overwrite"
downloadFile "$REPOSITORY/modules/files/dotfiles/.xinitrc" "/home/adam/.xinitrc" "--overwrite"

