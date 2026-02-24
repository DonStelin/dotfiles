ZINIT_HOME="${XDG_DATA_HOME:-$HOME/.local/share}/zinit/zinit.git"
if [[ ! -f $ZINIT_HOME/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} plugin manager...%f"
    command mkdir -p "$(dirname $ZINIT_HOME)"
    command git clone https://github.com/zdharma-continuum/zinit "$ZINIT_HOME"
fi

source "$ZINIT_HOME/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions

autoload -U compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-$ZSH_VERSION"
zinit cdreplay -q
autoload -U colors && colors
autoload -Uz edit-command-line

zinit light Aloxaf/fzf-tab

source <(fzf --zsh)
bindkey -e
zle -N edit-command-line
bindkey '^X^E' edit-command-line

alias cat='bat --theme=Nord'
alias cnvim='nvim --clean'
alias grep="grep --color=auto"
alias tms='tmux-sessionizer'

NEWLINE=$'\n'
PROMPT="${NEWLINE}%K{#414868}%F{#c0caf5} %~ %f%k %F{#c0caf5}❯ %f"

HISTSIZE=3000
SAVEHIST=3000
HISTFILE="$XDG_CACHE_HOME/zsh_history"

setopt append_history
setopt inc_append_history
setopt share_history
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt auto_param_slash

