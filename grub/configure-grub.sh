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
  echo " - Disable the Intel 'iTCO_wdt' watchdog explicitly."
  echo " - Disable the AMD 'sp5100_tco' watchdog explicitly."
  echo " - Replace the older, 'rhgb' parameter with the new 'splash' parameter."
  sudo grubby --update-kernel=ALL --args='nowatchdog nmi_watchdog=0 modprobe.blacklist=iTCO_wdt modprobe.blacklist=sp5100_tco splash'
  sudo grubby --update-kernel=ALL --remove-args='rhgb'

  echo ''
  echo 'Printing the kernel command-line parameters from the default GRUB entry.'
  echo ''
  sudo grubby --info=DEFAULT

  echo ''
  echo 'IMPORTANT!'
  echo '==========================================================================='
  echo 'To disable kernel lockdown mode (if supported by kernel compilation flags):'
  echo '==========================================================================='
  echo ''
  echo 'To properly enable hibernation support, run the below commands (depending on your setup).'
  echo "sudo grubby --update-kernel=ALL --args='lockdown=none'"
  echo ''
  echo '==================================='
  echo 'If hibernating to a swap partition:'
  echo '==================================='
  echo "sudo grubby --update-kernel=ALL --args='resume=UUID=<UUID_OF_YOUR_HIBERNATION_SWAP_PARTITION>'"
  echo ''
  echo "Get '<UUID_OF_YOUR_HIBERNATION_SWAP_PARTITION>' by inspecting the output of 'lsblk -o NAME,TYPE,SIZE,MOUNTPOINT,UUID'"
  echo ''
  echo '=========================================================='
  echo 'If hibernating to a swap file (on a non-BTRFS filesystem):'
  echo '=========================================================='
  echo "sudo grubby --update-kernel=ALL --args='resume=UUID=<UUID_OF_THE_DEVICE_WHERE_THE_HIBERNATION_SWAP_FILE_RESIDES> resume_offset=<OFFSET_OF_THE_HIBERNATION_SWAP_FILE>'"
  echo ''
  echo "Get <UUID_OF_THE_DEVICE_WHERE_THE_HIBERNATION_SWAP_FILE_RESIDES> by inspecting the output of 'lsblk -o NAME,TYPE,SIZE,MOUNTPOINT,UUID'"
  echo "Get <OFFSET_OF_THE_HIBERNATION_SWAP_FILE> by running 'sudo filefrag -v <ABSOLUTE_PATH_TO_YOUR_HIBERNATION_SWAP_FILE> | awk '\$1==\"0:\" {print substr(\$4, 1, length(\$4)-2)}''"
  echo ''
  echo '======================================================'
  echo 'If hibernating to a swap file (on a BTRFS filesystem):'
  echo '======================================================'
  echo "sudo grubby --update-kernel=ALL --args='resume=UUID=<UUID_OF_THE_DEVICE_WHERE_THE_HIBERNATION_SWAP_FILE_RESIDES> resume_offset=<OFFSET_OF_THE_HIBERNATION_SWAP_FILE>'"
  echo ''
  echo "Get <UUID_OF_THE_DEVICE_WHERE_THE_HIBERNATION_SWAP_FILE_RESIDES> by inspecting the output of 'lsblk -o NAME,TYPE,SIZE,MOUNTPOINT,UUID'"
  echo "Get <OFFSET_OF_THE_HIBERNATION_SWAP_FILE> by running 'sudo btrfs inspect-internal map-swapfile -r <ABSOLUTE_PATH_TO_YOUR_HIBERNATION_SWAP_FILE>'."

fi

# Unset the variables used.
unset is_grubby_installed
