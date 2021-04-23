#!/bin/bash

cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git yay
sudo chown -R $USER:wheel yay
cd yay
makepkg -si

yay -S --needed - < ~/.dotfiles/pkglist.txt

mkdir -p ~/downloads
cd ~/downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
unzip FiraMono.zip
rm -rf FiraMono.zip *Windows*
sudo mkdir -p /usr/share/fonts/FiraMono
sudo mv *.otf /usr/share/fonts/FiraMono

cd ~/.dotfiles
./setup.sh

cd ~/.local/share/nvim/site/pack/$USER/start
git clone https://github.com/junegunn/fzf.vim
