#!/usr/bin/env bash

# The 'echo' statements above the commands are self-explanatory.

echo -e 'Making the following changes to all kernel entries in the GRUB bootloader:'
echo -e '- Suppress log messages.'
echo -e '- Disable all watchdogs.'
echo -e '- Disable the NMI watchdog explicitly.'
echo -e "- Disable the Intel 'iTCO_wdt' watchdog explicitly."
echo -e "- Disable the AMD 'sp5100_tco' watchdog explicitly."
echo -e "- Set the default suspend state to 'deep' i.e. in-memory."
echo -e "- Disable the 'nouveau' driver from being loaded in the initial ramdisk stage."
echo -e "- Disable the 'nouveau' driver from being loaded later in the boot process."
echo -e '- Enable the Kernel Mode Setting feature for the NVIDIA driver.'
echo -e '- Enable a framebuffer device for the NVIDIA driver.'
sudo grubby --update-kernel=ALL --args='quiet nowatchdog nmi_watchdog=0 modprobe.blacklist=iTCO_wdt modprobe.blacklist=sp5100_tco mem_sleep_default=deep modprobe.blacklist=nouveau rd.driver.blacklist=nouveau nvidia-drm.modeset=1 nvidia-drm.fbdev=1'

echo -e 'Printing the kernel command-line parameters from the default GRUB entry.'
sudo grubby --info=DEFAULT