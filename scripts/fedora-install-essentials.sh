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
  wezterm \
  ShellCheck \
  shfmt \
  solaar \
  steam \
  mangohud \
  goverlay \
  decibels \
  papers \
  papers-nautilus \
  showtime \
  powertop \
  google-chrome-stable \
  brave-browser \
  ffmpeg \
  intel-media-driver \
  iwd \
  virt-install \
  libvirt-daemon-config-network \
  libvirt-daemon-kvm \
  qemu-kvm \
  virt-manager \
  virt-viewer \
  guestfs-tools \
  python3-libguestfs \
  virt-top \
  systemd-container \
  asusctl \
  asusctl-rog-gui \
  procs \
  bat \
  ripgrep

# Try to reboot to finish package removals.
echo "Attempting to reboot now, please enter 'n/N' if you wish to reboot manually later using the command 'sudo dnf offline reboot'."
sudo dnf offline reboot
