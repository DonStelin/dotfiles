#!/usr/bin/env bash

detect_distro() {
  source /etc/os-release
  echo "$ID"
}

is_fedora() {
  [[ "$(detect_distro)" =~ ^(fedora|nobara)$ ]]
}

is_debian() {
  [[ "$(detect_distro)" =~ ^(debian|ubuntu)$ ]]
}
