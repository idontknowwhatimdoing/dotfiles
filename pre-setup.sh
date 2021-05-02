#!/bin/bash

cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git yay
sudo chown -R $USER:wheel yay
cd yay
makepkg -si

yay -S --needed --noconfirm - < ~/.dotfiles/pkglist.txt

mkdir -p ~/downloads
cd ~/downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
unzip FiraMono.zip
rm -rf FiraMono.zip *Windows*
sudo mkdir -p /usr/share/fonts/FiraMono
sudo mv *.otf /usr/share/fonts/FiraMono

mkdir -p ~/.config/alacritty
mkdir -p ~/.config/tmux
mkdir -p ~/.config/nvim/colors
mkdir -p ~/.config/polybar/scripts
mkdir -p ~/.config/rofi
dir=$(echo -n ~/.mozilla/firefox/ ; grep -i default ~/.mozilla/firefox/installs.ini | awk -F= '{print $2}')
mkdir -p $dir/chrome

cd ~/.local/share/nvim/site/pack/$USER/start
git clone https://github.com/junegunn/fzf.vim
