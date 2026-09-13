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

alias cnvim='nvim --clean'
alias cp='cp --recursive --verbose --progress'
alias grep='grep --color=auto'
alias ls='ls -laFh --color=auto'
alias mv='mv --interactive --verbose'
alias rm='rm --recursive --verbose'
alias tms='tmux-sessionizer'



# PROMPT="${NEWLINE}%K{#414868}%F{#c0caf5} %~ %f%k %F{#c0caf5}❯ %f"
# PROMPT="${NEWLINE}%K{#332b46}%F{#d4c2f0} %~ %f%k %F{#b394d6}❯ %f"
# PROMPT="${NEWLINE}%K{#18151e}%F{#c4a7e7} %~ %f%k %F{#c4a7e7}❯ %f"
# PROMPT="${NEWLINE}%K{#a78bca}%F{#18151e} %~ %f%k %F{#a78bca}❯ %f"
#
#
NEWLINE=$'\n'

vcs_branch_info() {
  local info

  if [[ -d .jj || -n $JJ_ROOT ]] || [[ -d ../.jj ]]; then
    if info=$(jj log --no-graph -r @ \
      -T 'change_id.shortest() ++ " " ++ bookmarks' 2>/dev/null); then
      echo "%F{#c0caf5} jj:${info}%f"
      return
    fi
  fi

  if info=$(git branch --show-current 2>/dev/null); then
    [[ -n $info ]] && echo "%F{#c0caf5} git:${info}%f"
  fi
}

setopt PROMPT_SUBST
PROMPT='${NEWLINE}%K{#18151e}%F{#c4a7e7} %~ %f$(vcs_branch_info) %k %F{#c4a7e7}❯  %f'

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

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

