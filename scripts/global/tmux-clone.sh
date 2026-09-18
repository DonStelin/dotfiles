#!/usr/bin/env bash

if [ -z "${1:-}" ]; then
  echo "uso: $(basename "$0") <repo-url>" >&2
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

name="$(basename "${1%.git}")"
dest="$target/$name"

git clone "$1" "$dest"

if [ -n "$TMUX" ]; then
    tmux new-session -d -s "$name" -c "$dest"
    tmux switch-client -t "$name"
else
    tmux new-session -s "$name" -c "$dest"
fi
