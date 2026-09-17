plugin_dir="${XDG_DATA_HOME:-$HOME/.local/share}/zsh/plugins"
fpath=("$plugin_dir/zsh-completions/src" $fpath)
source "$plugin_dir/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
autoload -U compinit
compinit -d "${XDG_CACHE_HOME:-$HOME/.cache}/zcompdump-$ZSH_VERSION"
source "$plugin_dir/fzf-tab/fzf-tab.plugin.zsh"
autoload -U colors && colors
autoload -Uz edit-command-line

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

# export NVM_DIR="$HOME/.config/nvm"
# [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
# [ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

