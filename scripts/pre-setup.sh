#!/bin/sh

cd /opt
sudo git clone https://aur.archlinux.org/yay-git.git yay
sudo chown -R $USER:wheel yay
cd yay
makepkg -si

yay -S --needed --noconfirm - < $HOME/dotfiles/pkglist.txt

mkdir -p $HOME/downloads && cd $HOME/downloads
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
unzip FiraMono.zip
rm -rf FiraMono.zip *Windows*
sudo mkdir -p /share/fonts/FiraMono && sudo mv *.otf /share/fonts/FiraMono
fc-cache

mkdir -p $HOME/.config/{alacritty,tmux,nvim/colors,polybar/scripts,rofi,bspwm,sxhkd,dunst,X11,zsh}
dir=$(echo -n ~/.mozilla/firefox/ ; grep -i default ~/.mozilla/firefox/installs.ini | awk -F= '{print $2}')
mkdir -p $dir/chrome

mkdir -p $HOME/.local/share/nvim/site/pack/$USER/start && cd $HOME/.local/share/nvim/site/pack/$USER/start
git clone https://github.com/junegunn/fzf.vim
