#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Get the ID of the current user.
current_user_id="$(id -u)"

# Check if the script is not running as 'root'.
if [ "${current_user_id}" -ne 0 ]; then

  echo "Script is not running as 'root'."
  echo "Attempting to switch to 'root'."

  # Re-execute this script as 'root'.
  exec sudo "$0" "$@"

  # Due to the 'exec' command above, the below lines of code will not execute if the script succeeds running as 'root'.
  echo "Failed to switch to the 'root' user."
  exit 1

# Otherwise, if the script is running as 'root'.
else

  # Install necessary/essential packages.
  dnf install \
    --offline \
    --refresh \
    --assumeyes \
    --setopt=max_parallel_downloads=8 \
    --setopt=minrate=1024k \
    --setopt=timeout=3 \
    --setopt=fastestmirror=True \
    --setopt=gpgcheck=True \
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
    decibels \
    papers \
    papers-nautilus \
    showtime \
    ShellCheck \
    shfmt \
    solaar \
    steam \
    powertop

  # Unset the variables used.
  unset current_user_id

  # Try to reboot to finish package removals.
  echo "Attempting to reboot now, please enter 'n/N' if you wish to reboot manually later using the command 'sudo dnf offline reboot'."
  dnf offline reboot

fi
