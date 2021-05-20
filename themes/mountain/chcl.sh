#!/usr/bin/bash

if [[ $# -ne 2 ]]; then
	echo 'usage: chcl.sh <color> <#RRGGBB>'
	echo 'possible values for <color>:'
	echo - fg
	echo - bg
	echo - red
	echo - green
	echo - yellow
	echo - blue
	echo - magenta
	echo - cyan
	exit
fi

if ! [[ $2 =~ ^#[[:xdigit:]]{6}$ ]]; then
	echo $2: bad color
	exit
fi

color=$(grep $1 alacritty/alacritty.yml | awk -F"'" '{print $2}' | head -n 1)

find . -type f -exec sed -i "s/$color/$2/g" {} \;

cd ../.. && ./set-theme.sh mountain
