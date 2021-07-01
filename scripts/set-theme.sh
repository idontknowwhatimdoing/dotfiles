#!/bin/sh

link_files() {
	[ -z "$XDG_CONFIG_HOME" ] && XDG_CONFIG_HOME=$HOME/.config

	ln -f ~/.dotfiles/themes/$theme/alacritty/alacritty.yml $XDG_CONFIG_HOME/alacritty
	ln -f ~/.dotfiles/themes/$theme/tmux/tmux.conf $XDG_CONFIG_HOME/tmux/tmux.conf
	ln -f ~/.dotfiles/nvim/init.vim $XDG_CONFIG_HOME/nvim
	ln -f ~/.dotfiles/nvim/tabline.vim $XDG_CONFIG_HOME/nvim
	ln -f ~/.dotfiles/nvim/plugins.vim $XDG_CONFIG_HOME/nvim
	ln -f ~/.dotfiles/themes/$theme/nvim/statusline.vim $XDG_CONFIG_HOME/nvim
	ln -f ~/.dotfiles/themes/$theme/nvim/$theme.vim $XDG_CONFIG_HOME/nvim/colors
	ln -f ~/.dotfiles/themes/$theme/bspwm/bspwmrc $XDG_CONFIG_HOME/bspwm
	ln -f ~/.dotfiles/themes/$theme/picom/picom.conf $XDG_CONFIG_HOME/picom
	ln -f ~/.dotfiles/themes/$theme/polybar/config $XDG_CONFIG_HOME/polybar
	ln -f ~/.dotfiles/scripts/polybar/launch.sh $XDG_CONFIG_HOME/polybar/scripts
	ln -f ~/.dotfiles/scripts/polybar/check-updates.sh $XDG_CONFIG_HOME/polybar/scripts
	ln -f ~/.dotfiles/zsh/zshrc $ZDOTDIR/.zshrc
	ln -f ~/.dotfiles/zsh/zprofile $ZDOTDIR/.zprofile
	ln -f ~/.dotfiles/zsh/zshenv ~/.zshenv
	ln -f ~/.dotfiles/zsh/aliasrc $ZDOTDIR/aliasrc
	ln -f ~/.dotfiles/zsh/completionrc $ZDOTDIR/completionrc
	ln -f ~/.dotfiles/themes/$theme/zsh/prompt $ZDOTDIR/prompt
	ln -f ~/.dotfiles/themes/$theme/zsh/fzfrc $ZDOTDIR/fzfrc
	ln -f ~/.dotfiles/rofi/config.rasi $XDG_CONFIG_HOME/rofi
	ln -f ~/.dotfiles/themes/$theme/rofi/$theme.rasi $XDG_CONFIG_HOME/rofi
	ln -f ~/.dotfiles/themes/$theme/dunst/dunstrc $XDG_CONFIG_HOME/dunst
	dir=$(echo -n ~/.mozilla/firefox/ ; grep -i default ~/.mozilla/firefox/installs.ini | awk -F= '{print $2}')
	ln -f ~/.dotfiles/themes/$theme/firefox/user.js $dir
	ln -f ~/.dotfiles/themes/$theme/firefox/userChrome.css $dir/chrome
	ln -f ~/.dotfiles/themes/$theme/firefox/userContent.css $dir/chrome
	cp -r ~/.dotfiles/themes/$theme/firefox/popup $dir/chrome
	ln -f ~/.dotfiles/sxhkd/sxhkdrc $XDG_CONFIG_HOME/sxhkd
	ln -f ~/.dotfiles/xorg/xinitrc $XDG_CONFIG_HOME/X11/xinitrc

	bspc wm -r
}

[ "$#" -eq 1 ] && theme=$1 && link_files && echo $theme > ~/.dotfiles/.current

theme=$(ls ~/.dotfiles/themes | fzf --disabled --preview-window=hidden)
[ -n "$theme" ] && link_files && echo $theme > ~/.dotfiles/.current
