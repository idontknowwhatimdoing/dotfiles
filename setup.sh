#!/bin/bash

mkdir -p ~/.config/alacritty
ln -f alacritty/alacritty.yml ~/.config/alacritty

mkdir -p ~/.config/tmux
ln -f tmux/tmux.conf ~/.config/tmux

mkdir -p ~/.config/nvim/colors
ln -f nvim/init.vim ~/.config/nvim
ln -f nvim/yep.vim ~/.config/nvim/colors
ln -f nvim/plugins.vim ~/.config/nvim
mkdir -p ~/.local/share/nvim/site/pack/$USER/start
git clone https://github.com/junegunn/fzf.vim

mkdir -p ~/.config/i3
ln -f i3/config ~/.config/i3

mkdir -p ~/.config/polybar/scripts
ln -f polybar/config ~/.config/polybar
ln -f polybar/check-updates.sh ~/.config/polybar/scripts
ln -f polybar/launch.sh ~/.config/polybar/scripts

ln -f zsh/zshrc ~/.zshrc

mkdir -p ~/.config/rofi
ln -f rofi/config.rasi ~/.config/rofi
ln -f rofi/yep.rasi ~/.config/rofi

ln -f xorg/xinitrc ~/.xinitrc
sudo cp xorg/*.conf /etc/X11/xorg.conf.d

dir=$(find ~/.mozilla/firefox -type d -iregex ".*default-release")
mkdir -p $dir/chrome
ln -f firefox/user.js $dir
cp -r firefox/* $dir/chrome
