#!/usr/bin/bash

if [[ $# -ne 2 ]]; then
	echo 'usage: chcl.sh <color> <#RRGGBB>'
	exit
fi

if ! [[ $2 =~ ^#[[:xdigit:]]{6}$ ]]; then
	echo $2: bad color
	exit
fi

bg=$(grep background alacritty/alacritty.yml | awk -F"'" '{print $2}' | head -n 1)
fg=$(grep foreground alacritty/alacritty.yml | awk -F"'" '{print $2}' | head -n 1)
red=$(grep red alacritty/alacritty.yml | awk -F"'" '{print $2}' | head -n 1)
green=$(grep green alacritty/alacritty.yml | awk -F"'" '{print $2}' | head -n 1)
yellow=$(grep yellow alacritty/alacritty.yml | awk -F"'" '{print $2}' | head -n 1)
blue=$(grep blue alacritty/alacritty.yml | awk -F"'" '{print $2}' | head -n 1)
magenta=$(grep magenta alacritty/alacritty.yml | awk -F"'" '{print $2}' | head -n 1)
cyan=$(grep cyan alacritty/alacritty.yml | awk -F"'" '{print $2}' | head -n 1)

case $1 in
	fg)
		find . -type f -exec sed -i "s/$fg/$2/g" {} \; ;;
	bg)
		find . -type f -exec sed -i "s/$bg/$2/g" {} \; ;;
	red)
		find . -type f -exec sed -i "s/$red/$2/g" {} \; ;;
	green)
		find . -type f -exec sed -i "s/$green/$2/g" {} \; ;;
	yellow)
		find . -type f -exec sed -i "s/$yellow/$2/g" {} \; ;;
	blue)
		find . -type f -exec sed -i "s/$blue/$2/g" {} \; ;;
	magenta)
		find . -type f -exec sed -i "s/$magenta/$2/g" {} \; ;;
	cyan)
		find . -type f -exec sed -i "s/$cyan/$2/g" {} \; ;;
	*)
		echo bad color name
		exit
		;;
esac
