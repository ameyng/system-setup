#!/usr/bin/env bash

# Check if the 'grubby' binary is not available in 'PATH'.
if [[ 0 -ne $(command -v grubby > /dev/null 2>&1; echo $?) ]]; then

  # Print an error and exit.
  echo -e "The program 'grubby' is not installed."
  exit 1

fi

# Check if the script is executing as 'root'.
if [[ ${EUID} -ne 0 ]]; then

  echo -e "\nScript is running as '$(whoami)', not 'root'.\nAttempting to switch to 'root'."

  # Re-execute this script as 'root'.
  exec sudo "$0" "$@"

  # Due to the 'exec' command above, the below lines of code will not execute if the script succeeds running as 'root'.
  echo -e "\nFailed to switch to the 'root' user, exiting."
  exit 1

fi

echo -e '\nMaking the following changes to all kernel entries in the GRUB bootloader:'
echo -e '- Disable all watchdogs.'
echo -e '- Disable the NMI watchdog explicitly.'
echo -e "- Disable the Intel 'iTCO_wdt' watchdog explicitly."
echo -e "- Disable the AMD 'sp5100_tco' watchdog explicitly."
echo -e "- Disable the 'nouveau' driver from being loaded in the initial ramdisk stage."
echo -e "- Disable the 'nouveau' driver from being loaded later in the boot process."
echo -e '- Enable the Kernel Mode Setting feature for the NVIDIA driver.'
echo -e '- Enable a framebuffer device for the NVIDIA driver.'
echo -e '- Disable active-state power management as it can often break.'
echo -e '- Enable logging upto level 4 i.e. warnings.'
grubby --update-kernel=ALL --args='nowatchdog nmi_watchdog=0 modprobe.blacklist=iTCO_wdt modprobe.blacklist=sp5100_tco modprobe.blacklist=nouveau rd.driver.blacklist=nouveau nvidia-drm.modeset=1 nvidia-drm.fbdev=1 pcie_aspm=off loglevel=4'

echo -e '\nPrinting the kernel command-line parameters from the default GRUB entry.\n'
grubby --info=DEFAULT

echo -e '\nSuccess!\n'
exit 0
