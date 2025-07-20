# Amazon Q pre block. Keep at the top of this file.
[[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"
source $(brew --prefix nvm)/nvm.sh

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"


compileproject() {
    g++ -Wall *.cpp -o "$1"
    echo "Compilación completada. Ejecutable generado: $1"
}


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk


# plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# snippets
zinit snippet OMZP::git
zinit snippet OMZP::sudo
zinit snippet OMZP::yarn


# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q


# Keybindings
bindkey -e
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
bindkey '^[w' kill-region

# History
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# Completion styling
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'


# Aliases
alias l="eza -l --icons --git -a"
alias vim='nvim'
alias c='clear'

# Shell integrations
eval "$(fzf --zsh)"
eval "$(zoxide init --cmd cd zsh)"

# Aliases
alias vim='nvim'
alias c='clear'
alias ls="lsd"
alias cat="bat"
alias reload!=". ~/.zshrc"
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias -- -="cd -"
alias cd="z";

alias undopush="git push -f origin HEAD^:master"
alias main="git switch main"
alias push="git push"
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit"
alias gdiff="git diff"
alias undo="git reset --soft HEAD"

alias zshconfig="nvim ~/.zshrc"
alias with="curl wttr.in"
alias cat=bat
alias start='tmux new-session -s "󰄛" -c "$PWD"'


#dotfiles
alias config="git --git-dir=$HOME/Dev/dotfiles --work-tree=$HOME"

#copilot
alias ghcs="gh copilot suggest"



export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

eval "$(starship init zsh)"
eval "$(zoxide init zsh)"

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
export PATH="/opt/homebrew/opt/ruby/bin:$PATH"
export PATH=$PATH:$(go env GOPATH)/bin
export PATH=$PATH:/Users/stelinlarios/.spicetify
export GOLANGCI_LINT_CONFIG="$HOME/.config/golangci/config.yml"


# Función para buscar archivos/directorios con fzf y navegar
fzf_find_file() {
    local selected_path
    # Modificación aquí: pasar la lista de archivos a fzf
    selected_path=$(find . -maxdepth 5 -type f -o -type d 2>/dev/null | fzf \
                        --preview '[[ -d {} ]] && ls -F {} || bat --color=always --line-range :500 {}' \
                        --bind 'ctrl-o:execute(nvim {})' \
                        --bind 'ctrl-x:execute(xdg-open {})' \
                        --header "Buscar (Enter para navegar/insertar, Ctrl+O para nvim, Ctrl+X para abrir)")
    
    if [[ -n "$selected_path" ]]; then
        if [[ -d "$selected_path" ]]; then
            # Si es un directorio, navegar a él
            zle reset-prompt # Limpiar la línea de commandos actual
            builtin cd "$selected_path"
        else
            # Si es un archivo, insertarlo en la línea de commandos
            LBUFFER+="$selected_path"
        fi
    fi
    zle redisplay
}

# Asegúrate de que esta línea esté presente y después de la definición de la función
zle -N fzf_find_file
bindkey '^F' fzf_find_file

eval "$(tv init zsh)"
