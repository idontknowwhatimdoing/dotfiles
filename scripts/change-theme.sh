#!/bin/sh

THEME=$(cat ~/.dotfiles/.current);
nb_theme=$(ls ~/.dotfiles/themes | wc -l)
theme=$(ls ~/.dotfiles/themes | rofi -theme $THEME -theme-str 'inputbar { enabled: false; }' -dmenu -p '' -l $nb_theme -width 20)
[ -n "$theme" ] && ~/.dotfiles/scripts/set-theme.sh $theme
