# dotfiles
Well, here are my dotfiles ...

## Scripts
I have a few scripts, here they are:

### pre-setup.sh
Installs all dependencies listed in pkglist.txt with pacman (and yay) as well as [Fira Mono Nerd Font and creates] (https://www.nerdfonts.com/font-downloads) the config directories.
You most likely don't need to use it, but if you do: `./pre-setup.sh` (requires sudo and git to be installed)

### set-theme.sh
Sets the theme (found in the themes directory) and links all config files
usage: `./set-theme.sh <theme>`
(You will need to restart your shell and your window manager for all the changes to take effect)

### chcl.sh
You can find this script in every directory inside the theme directory.
You specify a color name and a new color code to replace it.
usage: `./chcl.sh <color name> <#RRGGBB>`
exemple: `chsl.sh red #FF0000`
