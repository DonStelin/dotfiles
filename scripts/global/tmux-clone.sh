#!/usr/bin/env bash

if [ -z "${1:-}" ]; then
  echo "uso: $(basename "$0") <repo-url>" >&2
  exit 1
fi

target=$(
    {
        find "$HOME/Environment" -mindepth 0 -maxdepth 1 -type d -print
        find "$HOME/College"     -mindepth 0 -maxdepth 1 -type d -print
        find "$HOME/Dev"         -mindepth 0 -maxdepth 1 -type d -print
    } | fzf --height=90% --border=rounded --margin=15%,20%
)

if [ -z "${target:-}" ]; then
  echo "cancelado: no se seleccionó destino" >&2
  exit 0
fi

name="$(basename "${1%.git}")"
dest="$target/$name"

git clone "$1" "$dest"

if [ -n "$TMUX" ]; then
    tmux new-session -d -s "$name" -c "$dest"
    tmux switch-client -t "$name"
else
    tmux new-session -s "$name" -c "$dest"
fi
