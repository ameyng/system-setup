#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

echo 'Switching to the open-source kernel-space driver.'
echo '%_with_kmod_nvidia_open 1' | sudo tee '/etc/rpm/macros.nvidia-kmod' > /dev/null

echo 'Installing the required packages.'
sudo dnf install \
         --assumeyes \
         --refresh \
         --offline \
         --setopt=fastestmirror=True \
         --setopt=gpgcheck=True \
         --setopt=localpkg_gpgcheck=False \
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

echo ''
echo 'It is recommended to reboot immediately by running the below command:'
echo 'sudo dnf offline reboot --assumeyes'

# Exit with a successful error code.
exit 0
