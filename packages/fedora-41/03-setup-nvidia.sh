#!/usr/bin/env bash

echo -e 'Installing the required packages.'
sudo dnf install akmod-nvidia \
                 xorg-x11-drv-nvidia-cuda \
                 xorg-x11-drv-nvidia-power \
                 vulkan \
                 xorg-x11-drv-nvidia-cuda-libs \
                 nvidia-vaapi-driver \
                 libva-utils \
                 vdpauinfo \
                 intel-media-driver \
                 libva-nvidia-driver.{i686,x86_64}

echo -e 'Waiting for the NVIDIA kernel module to be built.'
while [[ 0 -ne $(modinfo -F version nvidia > /dev/null 2>&1; echo $?) ]]
do
  echo -e 'Waiting for 1 second.'
  sleep 1
done

echo -e 'Switching to the open source kernel-space driver.'
sudo sh -c 'echo "%_with_kmod_nvidia_open 1" > /etc/rpm/macros.nvidia-kmod'

echo -e 'Rebuilding the kernel module.'
sudo akmods --rebuild

echo -e 'NVIDIA kernel module details'
echo -e "Version: $(modinfo -F version nvidia)"
echo -e "License: $(modinfo -F license nvidia)"

echo -e 'Rebuilding the initial RAM disk.'
sudo dracut --force --verbose --no-compress --regenerate-all

echo -e 'Uninstalling unnecessary packages.'
sudo dnf autoremove

echo -e 'Making the following changes to all kernel entries in the GRUB bootloader:'
echo -e '- Enable logging of kernel messages upto level 4 (warning) and below.'
echo -e '- Disable all watchdogs.'
echo -e '- Disable the NMI watchdog explicitly.'
echo -e "- Disable the Intel 'iTCO_wdt' watchdog explicitly."
echo -e "- Disable the AMD 'sp5100_tco' watchdog explicitly."
echo -e "- Set the default suspend state to 'deep' i.e. in-memory."
echo -e "- Disable the 'nouveau' driver from being loaded in the initial ramdisk stage."
echo -e "- Disable the 'nouveau' driver from being loaded later in the boot process."
echo -e '- Enable the Kernel Mode Setting feature for the NVIDIA driver.'
echo -e '- Enable a framebuffer device for the NVIDIA driver.'
sudo grubby --update-kernel=ALL --args='loglevel=4 nowatchdog nmi_watchdog=0 modprobe.blacklist=iTCO_wdt modprobe.blacklist=sp5100_tco mem_sleep_default=deep modprobe.blacklist=nouveau rd.driver.blacklist=nouveau nvidia-drm.modeset=1 nvidia-drm.fbdev=1'
sudo grubby --update-kernel=ALL --remove-args='quiet'

echo -e '\nPrinting the kernel command-line parameters from the default GRUB entry.'
sudo grubby --info=DEFAULT

echo -e '\nIt is now STRONGLY RECOMMENDED to reboot!'
