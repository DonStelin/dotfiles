#!/usr/bin/env bash

hypr_conf_dir="$HOME/.config/hypr"
hypr_conf_file="$hypr_conf_dir/hyprland.conf"


if [[ -f "$hypr_conf_file" ]]
then
    rm -f "$HOME/.config/hypr/monitors.conf"
    ln -sf "$REPO_DIR/.config/hypr/custom.conf" "$hypr_conf_dir/"
    ln -sf "$REPO_DIR/.config/hypr/monitors.conf" "$hypr_conf_dir/"

    grep -qxF 'source = ~/.config/hypr/custom.conf' "$hypr_conf_file" \
        || echo 'source = ~/.config/hypr/custom.conf' >>"$hypr_conf_file"

    grep -qxF 'source = ~/.config/hypr/monitors.conf' "$hypr_conf_file" \
        || echo 'source = ~/.config/hypr/monitors.conf' >>"$hypr_conf_file"
fi







