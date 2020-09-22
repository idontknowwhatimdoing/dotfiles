#! /bin/bash
mkdir -p ~/.config/alacritty
ln -f alacritty.yml ~/.config/alacritty/alacritty.yml

ln -f tmux.conf ~/.tmux.conf

mkdir -p ~/.config/nvim
ln -f vimrc ~/.config/nvim/init.vim
mkdir -p ~/.config/nvim/colors
ln -f yep.vim ~/.config/nvim/colors

ln -f vimrc ~/.vimrc
sudo ln -f yep.vim `find / -regex ".*vim.*colors" 2>/dev/null`

mkdir ~/.config/i3
ln -f i3.conf ~/.config/i3/config

mkdir ~/.config/polybar
ln -f polybar.conf ~/.config/polybar/config
