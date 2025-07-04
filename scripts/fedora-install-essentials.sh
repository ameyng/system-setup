#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Install necessary/essential packages.
echo 'Installing the required packages.'
sudo dnf install \
  --offline \
  --assumeyes \
  --refresh \
  --allowerasing \
  --setopt=install_weak_deps=False \
  neovim \
  gdisk \
  git \
  docker-ce \
  docker-ce-cli \
  containerd.io \
  docker-buildx-plugin \
  docker-compose-plugin \
  docker-ce-rootless-extras \
  kmodtool \
  akmods \
  mokutil \
  openssl \
  python3-neovim \
  ShellCheck \
  shfmt \
  powertop \
  ffmpeg \
  intel-media-driver \
  iwd \
  wl-clipboard \
  inotify-tools

# Try to reboot to finish package removals.
echo "Attempting to reboot now, please enter 'n/N' if you wish to reboot manually later using the command 'sudo dnf offline reboot'."
sudo dnf offline reboot
