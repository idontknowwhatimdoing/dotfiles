#!/bin/sh

tmux has-session -t $1 || tmux new-session -s $1 -d "sh /home/yep/.config/tmux/scripts/$1"

tmux attach -t $1
