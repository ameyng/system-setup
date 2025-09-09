#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Initialize a variable to check if the program 'grubby' is installed.
is_grubby_installed="$(command -v grubby > /dev/null 2>&1; echo $?)"

# Check if the 'grubby' binary is not available in 'PATH'.
if [ 0 -ne "${is_grubby_installed}" ]; then

  # Print an error and exit.
  echo "The program 'grubby' is not installed."
  exit 1

# Otherwise, if the 'grubby' program is installed properly.
else

  echo ''
  echo 'Printing the kernel command-line parameters from the default GRUB entry.'
  echo ''
  echo 'GRUB configuration (before):'
  echo ''
  sudo grubby --info=DEFAULT
  echo ''

  echo 'Making the following changes to all kernel entries in the GRUB bootloader:'
  echo " - Remove the 'rhgb' parameter as it is old and obsolete and replace it with the newer 'splash' parameter."
  echo ' - Suppress console output during boot.'
  echo ' - Disable all watchdogs for power-saving.'
  echo ' - Disable all open source drivers for NVIDIA GPUs.'
  echo ' - Enable the kernel-mode setting for the proprietary NVIDIA driver.'
  echo ' - Enable a dedicated framebuffer device for the proprietary NVIDIA driver.'
  echo ' - Enable performance tuning capabilities for the AMD GPU drivers.'
  sudo grubby --update-kernel=ALL --remove-args='rhgb \$tuned_params' --args='quiet splash nowatchdog nmi_watchdog=0 modprobe.blacklist=iTCO_wdt,sp5100_tco,nouveau,nova_core,nova_drm rd.driver.blacklist=iTCO_wdt,sp5100_tco,nouveau,nova_core,nova_drm nvidia-drm.modeset=1 nvidia-drm.fbdev=1 amdgpu.ppfeaturemask=0xffffffff'

  echo ''
  echo 'Printing the adjusted kernel command-line parameters from the default GRUB entry.'
  echo ''
  echo 'GRUB configuration (after):'
  echo ''
  sudo grubby --info=DEFAULT

fi

# Unset the variables used.
unset is_grubby_installed

echo ''
echo 'It is recommended to reboot the system immediately.'

# Exit with a successful error code.
exit 0
