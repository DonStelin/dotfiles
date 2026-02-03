#!/usr/bin/env bash

REPO_DIR="${REPO_DIR:-$HOME/Dotfiles}"
hypr_conf_dir="$HOME/.config/hypr"
hypr_conf_file="$hypr_conf_dir/hyprland.conf"
repo_hypr_conf="$REPO_DIR/env/.config/hypr"

echo -e "\n...Configuring hyprland..."

if [[ -f "$hypr_conf_file" ]]; then
  echo "Linking hyprland configuration files..."
  ln -sf "$repo_hypr_conf/custom.conf" "$hypr_conf_dir/"
  ln -sf "$repo_hypr_conf/monitors.conf" "$hypr_conf_dir/"

  echo "Adding source directives to hyprland.conf..."
  grep -qxF 'source = ~/.config/hypr/custom.conf' "$hypr_conf_file" ||
    echo 'source = ~/.config/hypr/custom.conf' >>"$hypr_conf_file"

  grep -qxF 'source = ~/.config/hypr/monitors.conf' "$hypr_conf_file" ||
    echo 'source = ~/.config/hypr/monitors.conf' >>"$hypr_conf_file"

  echo "Hyprland configuration completed successfully"
else
  echo "Warning: hyprland.conf not found at $hypr_conf_file"
  echo "Skipping hyprland configuration"
fi
