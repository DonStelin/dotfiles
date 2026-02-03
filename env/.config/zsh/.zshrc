### Added by Zinit's installer
ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"

if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager...%f"
    command mkdir -p "$(dirname $ZINIT_HOME)"
    command git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$ZINIT_HOME/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit


zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

autoload -U compinit && compinit
autoload -U colors && colors
autoload -Uz edit-command-line


source <(fzf --zsh)

bindkey -e

zle -N edit-command-line
bindkey '^X^E' edit-command-line

alias tms='tmux-sessionizer'
alias cnvim='nvim --clean'
alias grep="grep --color=auto"

PS1="%{$fg[magenta]%}%~%{$fg[red]%} %{$reset_color%}$%b "


# history opts
HISTSIZE=3000
SAVEHIST=3000
HISTFILE="$XDG_CACHE_HOME/zsh_history"
HISTCONTROL=ignoreboth
