#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Switch to the open source kernel-space driver.
echo 'Switching to the open-source kernel-space driver.'
echo '%_with_kmod_nvidia_open 1' | sudo tee '/etc/rpm/macros.nvidia-kmod' > /dev/null

# Install the required packages.
echo 'Installing the required packages.'
sudo dnf install \
  --assumeyes \
  --refresh \
  akmod-nvidia \
  xorg-x11-drv-nvidia-cuda \
  xorg-x11-drv-nvidia-power \
  xorg-x11-drv-nvidia-cuda-libs \
  vulkan \
  libva-nvidia-driver.x86_64 \
  libva-nvidia-driver.i686 \
  libva-utils \
  vdpauinfo \
  vulkan-tools

# Exit with a successful error code.
exit 0
