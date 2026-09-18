#!/usr/bin/env bash
if [[ $# -eq 1 ]]; then
  selected=$1
else
  selected=$(
    {
      # fd no incluye el directorio base, se añade a mano (equivale a mindepth 0)
      [[ -d "$HOME/Environment" ]] && printf '%s\n' "$HOME/Environment"
      fd . "$HOME/Environment" --min-depth 1 --max-depth 1 --type d --absolute-path --hidden 2>/dev/null
      fd . "$HOME/College" --min-depth 1 --max-depth 1 --type d --absolute-path --hidden 2>/dev/null
      fd . "$HOME/Dev" --min-depth 1 --max-depth 2 --type d --absolute-path --hidden 2>/dev/null
      [[ -d "$HOME/Dotfiles" ]] && printf '%s\n' "$HOME/Dotfiles"
      fd . "$HOME/Documents" --min-depth 1 --max-depth 1 --type d --absolute-path --hidden 2>/dev/null
      [[ -d "$HOME/Cloud" ]] && printf '%s\n' "$HOME/Cloud"
    } | fzf --height=90% --border=rounded --margin=15%,20%
  )
fi

if [[ -z $selected ]]; then
  exit 0
fi

selected_name=$(basename "$selected" | tr . _)
tmux_running=$(pgrep tmux)

if [[ -z $TMUX ]] && [[ -z $tmux_running ]]; then
  tmux new-session -s $selected_name -c $selected
  exit 0
fi

if ! tmux has-session -t=$selected_name 2>/dev/null; then
  tmux new-session -ds $selected_name -c $selected
fi

if [[ -z $TMUX ]]; then
  tmux attach -t $selected_name
else
  tmux switch-client -t $selected_name
fi
