#! /bin/bash
ln -f alacritty.yml ~/.alacritty.yml
ln -f tmux.conf ~/.tmux.conf
ln -f vimrc ~/.vimrc
ln -f starship ~/.starship
sudo find /usr/share/vim -type d -regex ".*vim[0-9][0-9]$" -exec ln -f yep.vim {}/colors/yep.vim \;
