#!/usr/bin/env bash

# Helper functions for distro detection
# These are used by individual install scripts

detect_distro() {
    source /etc/os-release
    echo "$ID"
}

is_fedora() {
    [[ "$(detect_distro)" =~ ^(fedora|nobara)$ ]]
}

is_arch() {
    [[ "$(detect_distro)" =~ ^(arch|cachyos)$ ]]
}
