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

  echo 'Making the following changes to all kernel entries in the GRUB bootloader:'
  echo ' - Disable all watchdogs.'
  echo ' - Disable the NMI watchdog explicitly.'
  echo " - Disable the Intel 'iTCO_wdt' and the AMD 'sp5100_tco' watchdogs explicitly."
  echo " - Disable the 'nouveau', 'nova_core' and 'nova_drm' kernel modules from being loaded at the initial ramdisk stage and later."
  echo " - Enable the kernel mode setting parameter for the NVIDIA proprietary driver."
  echo " - Enable a dedicated framebuffer device for the NVIDIA proprietary driver."
  echo " - Remove the 'rhgb' and 'splash' parameters for a faster boot with no graphical elements."
  sudo grubby --update-kernel=ALL --args='nowatchdog nmi_watchdog=0 modprobe.blacklist=iTCO_wdt modprobe.blacklist=sp5100_tco modprobe.blacklist=nouveau modprobe.blacklist=nova_core modprobe.blacklist=nova_drm rd.driver.blacklist=nouveau rd.driver.blacklist=nova_core rd.driver.blacklist=nova_drm nvidia-drm.modeset=1 nvidia-drm.fbdev=1'
  sudo grubby --update-kernel=ALL --remove-args='rhgb splash'

  echo ''
  echo 'Printing the kernel command-line parameters from the default GRUB entry.'
  echo ''
  sudo grubby --info=DEFAULT

fi

# Unset the variables used.
unset is_grubby_installed
