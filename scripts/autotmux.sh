case $- in *i*) ;; *) return ;; esac
[ -n "$TMUX" ] && return
command -v tmux >/dev/null 2>&1 || return

if tmux ls >/dev/null 2>&1; then
  last="$(tmux ls -F '#{session_last_attached} #{session_name}' 2>/dev/null | sort -nr | awk 'NR==1{print $2}')"
  [ -n "$last" ] && exec tmux attach -t "$last"
  first="$(tmux ls -F '#{session_name}' 2>/dev/null | head -n1)"
  [ -n "$first" ] && exec tmux attach -t "$first"
else
  if command -v tms >/dev/null 2>&1; then
    exec tms
  else
    exec tmux new -s main
  fi
fi
