#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Install necessary/essential packages.
echo 'Installing the required packages.'
sudo dnf install \
  --assumeyes \
  --refresh \
  --allowerasing \
  wezterm \
  vim \
  git \
  kmodtool \
  akmods \
  mokutil \
  openssl \
  ShellCheck \
  shfmt \
  powertop \
  ffmpeg \
  intel-media-driver \
  iwd

# Exit with a successful error code.
exit 0
