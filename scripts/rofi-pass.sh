#!/bin/sh

pass_dir=${PASSWORD_STORE_DIR:-$HOME}
pw=$(find $pass_dir -type f -name "*.gpg" -print0 | xargs -0 basename -s .gpg | rofi -dmenu -p '' -l 10 -width 20)
[ -n "$pw" ] && pass -c $pw
