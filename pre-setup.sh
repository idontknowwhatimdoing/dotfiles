#!/bin/bash

sudo pacman --noconfirm -S git
cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git yay
sudo chown -R $USER:wheel ./yay
cd yay
makepkg -si

yay --noconfirm -S --needed - < pkglist.txt

cd
./setup.sh
