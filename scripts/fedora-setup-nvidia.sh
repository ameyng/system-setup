#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Install the required packages.
echo 'Installing the required packages.'
sudo dnf install \
  --offline \
  --assumeyes \
  akmod-nvidia \
  xorg-x11-drv-nvidia-cuda \
  xorg-x11-drv-nvidia-power \
  xorg-x11-drv-nvidia-cuda-libs \
  vulkan \
  libva-nvidia-driver.x86_64 \
  libva-nvidia-driver.i686 \
  nvidia-vaapi-driver \
  libva-utils \
  vdpauinfo

# Switch to the open source kernel-space driver.
echo 'Switching to the open-source kernel-space driver.'
echo '%_with_kmod_nvidia_open 1' | sudo tee '/etc/rpm/macros.nvidia-kmod' > /dev/null

# Try to reboot to finish package removals.
echo "Attempting to reboot now, please enter 'n/N' if you wish to reboot manually later using the command 'sudo dnf offline reboot'."
sudo dnf offline reboot
