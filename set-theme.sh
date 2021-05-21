#!/bin/sh

function link_files() {
	ln -f themes/$theme/alacritty/alacritty.yml ~/.config/alacritty
	ln -f themes/$theme/tmux/tmux.conf ~/.config/tmux/tmux.conf
	ln -f themes/$theme/nvim/init.vim ~/.config/nvim
	ln -f themes/$theme/nvim/plugins.vim ~/.config/nvim
	ln -f themes/$theme/nvim/$theme.vim ~/.config/nvim/colors
	ln -f themes/$theme/i3/config ~/.config/i3
	ln -f themes/$theme/bspwm/bspwmrc ~/.config/bspwm
	ln -f themes/$theme/picom/picom.conf ~/.config/picom
	ln -f themes/$theme/polybar/config ~/.config/polybar
	ln -f themes/$theme/polybar/launch.sh ~/.config/polybar/scripts
	ln -f themes/$theme/polybar/check-updates.sh ~/.config/polybar/scripts
	ln -f themes/$theme/zsh/zshrc ~/.zshrc
	ln -f themes/$theme/rofi/config.rasi ~/.config/rofi
	ln -f themes/$theme/rofi/$theme.rasi ~/.config/rofi
	dir=$(echo -n ~/.mozilla/firefox/ ; grep -i default ~/.mozilla/firefox/installs.ini | awk -F= '{print $2}')
	ln -f themes/$theme/firefox/user.js $dir
	ln -f themes/$theme/firefox/userChrome.css $dir
	ln -f themes/$theme/firefox/userContent.css $dir
	cp -r themes/$theme/firefox/popup dir/chrome
	ln -f sxhkd/sxhkdrc ~/.config/sxhkd
	ln -f xorg/xinitrc ~/.xinitrc
	exit
}

[[ $# -eq 1 ]] && theme=$1 && link_files

theme=$(ls themes -1 | fzf --disabled --preview-window=hidden)
[[ -n $theme ]] && link_files
