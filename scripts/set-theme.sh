#!/bin/sh

link_files() {
	ln -f ~/.dotfiles/themes/$theme/alacritty/alacritty.yml ~/.config/alacritty
	ln -f ~/.dotfiles/themes/$theme/tmux/tmux.conf ~/.config/tmux/tmux.conf
	ln -f ~/.dotfiles/themes/$theme/nvim/init.vim ~/.config/nvim
	ln -f ~/.dotfiles/themes/$theme/nvim/plugins.vim ~/.config/nvim
	ln -f ~/.dotfiles/themes/$theme/nvim/$theme.vim ~/.config/nvim/colors
	ln -f ~/.dotfiles/themes/$theme/i3/config ~/.config/i3
	ln -f ~/.dotfiles/themes/$theme/bspwm/bspwmrc ~/.config/bspwm
	ln -f ~/.dotfiles/themes/$theme/picom/picom.conf ~/.config/picom
	ln -f ~/.dotfiles/themes/$theme/polybar/config ~/.config/polybar
	ln -f ~/.dotfiles/themes/$theme/polybar/launch.sh ~/.config/polybar/scripts
	ln -f ~/.dotfiles/themes/$theme/polybar/check-updates.sh ~/.config/polybar/scripts
	ln -f ~/.dotfiles/themes/$theme/zsh/zshrc ~/.zshrc
	ln -f ~/.dotfiles/themes/$theme/rofi/config.rasi ~/.config/rofi
	ln -f ~/.dotfiles/themes/$theme/rofi/$theme.rasi ~/.config/rofi
	dir=$(echo -n ~/.mozilla/firefox/ ; grep -i default ~/.mozilla/firefox/installs.ini | awk -F= '{print $2}')
	ln -f ~/.dotfiles/themes/$theme/firefox/user.js $dir
	ln -f ~/.dotfiles/themes/$theme/firefox/userChrome.css $dir/chrome
	ln -f ~/.dotfiles/themes/$theme/firefox/userContent.css $dir/chrome
	cp -r ~/.dotfiles/themes/$theme/firefox/popup $dir/chrome
	ln -f ~/.dotfiles/sxhkd/sxhkdrc ~/.config/sxhkd
	ln -f ~/.dotfiles/xorg/xinitrc ~/.xinitrc
	exit
}

[ "$#" -eq 1 ] && theme=$1 && link_files

theme=$(ls themes -1 | fzf --disabled --preview-window=hidden)
[ -n "$theme" ] && link_files
