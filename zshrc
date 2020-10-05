# The following lines were added by compinstall
zstyle ':completion:*' completer _expand _complete _ignored _correct _approximate
zstyle ':completion:*' expand suffix
zstyle ':completion:*' file-sort name
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' '+l:|=* r:|=*'
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/yep/.zshrc'
autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=500
SAVEHIST=500
unsetopt beep nomatch
bindkey -v
# End of lines configured by zsh-newuser-install

autoload -Uz vcs_info
precmd() { vcs_info }
setopt COMPLETE_ALIASES
setopt PROMPT_SUBST
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:*' formats "%F{yellow}%b%f "
zstyle ':completion:*' menu select
zstyle ':completion::complete:*' gain-privileges 1
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward
bindkey "^?" backward-delete-char
zmodload zsh/complist
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history

alias ls='ls --color=auto '
alias grep='grep --color '
alias vim=nvim
alias vi=nvim
alias tmux='tmux -f ~/.config/tmux/tmux.conf '

export EDITOR=nvim
export VISUAL=nvim
export PATH=$PATH:/home/yep/.cargo/bin
export KEYTIMEOUT=1
export PROMPT='%B%F{cyan}%3~%f ${vcs_info_msg_0_}%(?.%F{green}❯%f.%F{red}❯%f)%b '
