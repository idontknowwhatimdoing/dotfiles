#!/bin/sh

nb_theme=$(ls ~/.dotfiles/themes | wc -l)
theme=$(ls ~/.dotfiles/themes | rofi -dmenu -p '' -l $nb_theme -width 20)
[ -n "$theme" ] && ~/.dotfiles/scripts/set-theme.sh $theme
