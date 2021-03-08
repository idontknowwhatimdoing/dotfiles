#!/bin/bash

mkdir -p ~/.config/alacritty
ln -f alacritty.yml ~/.config/alacritty/alacritty.yml

mkdir -p ~/.config/tmux
ln -f tmux.conf ~/.config/tmux/tmux.conf

mkdir -p ~/.config/nvim
ln -f vim/vimrc ~/.config/nvim/init.vim
mkdir -p ~/.config/nvim/colors
ln -f vim/yep.vim ~/.config/nvim/colors/yep.vim

mkdir -p ~/.config/i3
ln -f i3.conf ~/.config/i3/config

mkdir -p ~/.config/polybar
ln -f polybar/config ~/.config/polybar/config
mkdir -p ~/.config/polybar/scripts
ln -f polybar/check-updates.sh ~/.config/polybar/scripts/check_updates.sh
ln -f polybar/launch.sh ~/.config/polybar/scripts/launch.sh

ln -f zsh/zshrc ~/.zshrc
ln -f zsh/zprofile ~/.zprofile

mkdir -p ~/.config/rofi
ln -f rofi/config.rasi ~/.config/rofi/config.rasi
ln -f rofi/yep.rasi ~/.config/rofi/yep.rasi

ln -f xorg/xinitrc ~/.xinitrc
