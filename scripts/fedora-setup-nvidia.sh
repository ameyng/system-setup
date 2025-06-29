#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Install the required packages.
echo 'Installing the required packages.'
sudo dnf install \
  --offline \
  --assumeyes \
  --refresh \
  akmod-nvidia \
  xorg-x11-drv-nvidia-cuda \
  xorg-x11-drv-nvidia-power \
  xorg-x11-drv-nvidia-cuda-libs \
  vulkan \
  libva-nvidia-driver.x86_64 \
  libva-nvidia-driver.i686 \
  nvidia-vaapi-driver \
  libva-utils \
  vdpauinfo \
  vulkan-tools

# Switch to the open source kernel-space driver.
echo 'Switching to the open-source kernel-space driver.'
echo '%_with_kmod_nvidia_open 1' | sudo tee '/etc/rpm/macros.nvidia-kmod' > /dev/null

# Initialize a variable to check if the program 'grubby' is installed.
is_grubby_installed="$(command -v grubby > /dev/null 2>&1; echo $?)"

# Check if the 'grubby' binary is not available in 'PATH'.
if [ 0 -ne "${is_grubby_installed}" ]; then

  # Print an error.
  echo "The program 'grubby' is not installed."

# Otherwise, if the 'grubby' program is installed properly.
else

  echo 'Making the following changes to all kernel entries in the GRUB bootloader:'
  echo " - Disable the 'nouveau' driver from being loaded in the initial ramdisk stage."
  echo " - Disable the 'nouveau' driver from being loaded later in the boot process."
  echo ' - Enable the Kernel Mode Setting feature for the NVIDIA driver.'
  echo ' - Enable a framebuffer device for the NVIDIA driver.'
  sudo grubby --update-kernel=ALL --args='modprobe.blacklist=nouveau rd.driver.blacklist=nouveau nvidia-drm.modeset=1 nvidia-drm.fbdev=1'

  echo ''
  echo 'Printing the kernel command-line parameters from the default GRUB entry.'
  echo ''
  sudo grubby --info=DEFAULT
  echo ''

fi

# Unset the variables used.
unset is_grubby_installed

# Try to reboot to finish package removals.
echo "Attempting to reboot now, please enter 'n/N' if you wish to reboot manually later using the command 'sudo dnf offline reboot'."
sudo dnf offline reboot
