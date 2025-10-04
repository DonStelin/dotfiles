#!/usr/bin/env bash

hypr_conf_dir="$HOME/.config/hypr"
hypr_conf_file="$hypr_conf_dir/hyprland.conf"
repo_hypr_conf="$REPO_DIR/env/.config/hypr"


if [[ -f "$hypr_conf_file" ]]
then
    ln -sf "$repo_hypr_conf/custom.conf" "$hypr_conf_dir/"
    ln -sf "$repo_hypr_conf/monitors.conf" "$hypr_conf_dir/"

    grep -qxF 'source = ~/.config/hypr/custom.conf' "$hypr_conf_file" \
        || echo 'source = ~/.config/hypr/custom.conf' >>"$hypr_conf_file"

    grep -qxF 'source = ~/.config/hypr/monitors.conf' "$hypr_conf_file" \
        || echo 'source = ~/.config/hypr/monitors.conf' >>"$hypr_conf_file"
fi

