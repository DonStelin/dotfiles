#!/usr/bin/env bash
if [ -z "${1:-}" ]; then
  echo "uso: $(basename "$0") <nombre-sesion>" >&2
  exit 1
fi

target=$(
  {
    [[ -d "$HOME/Environment" ]] && printf '%s\n' "$HOME/Environment"
    fd . "$HOME/Environment" --min-depth 1 --max-depth 1 --type d --absolute-path --hidden 2>/dev/null
    [[ -d "$HOME/College" ]] && printf '%s\n' "$HOME/College"
    fd . "$HOME/College" --min-depth 1 --max-depth 1 --type d --absolute-path --hidden 2>/dev/null
    [[ -d "$HOME/Dev" ]] && printf '%s\n' "$HOME/Dev"
    fd . "$HOME/Dev" --min-depth 1 --max-depth 1 --type d --absolute-path --hidden 2>/dev/null
  } | fzf --height=90% --border=rounded --margin=15%,20%
)

if [ -z "${target:-}" ]; then
  echo "cancelado: no se seleccionó destino" >&2
  exit 0
fi

path="$target/$1"
mkdir -p "$path"
git -C "$path" init

if [ -n "$TMUX" ]; then
  tmux new-session -d -s "$1" -c "$path"
  tmux switch-client -t "$1"
else
  tmux new-session -s "$1" -c "$path"
fi
