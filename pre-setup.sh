#!/bin/bash

cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git yay
sudo chown -R $USER:wheel ./yay
cd yay
makepkg -si

yay -S --needed - < pkglist.txt

mkdir -p ~/dowloads
cd ~/downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
unzip FiraMono.zip
rm -rf FiraMono.zip *Windows*
sudo mkdir -p /usr/share/fonts/FiraMono
sudo mv * /usr/share/fonts/FiraMono
fc-cache

cd
./setup.sh
