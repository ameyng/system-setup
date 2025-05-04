#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Check if the script is not running as 'root'.
if [ "$(id -u)" -ne 0 ]; then

  echo "Script is running as '$(whoami)', not 'root'."
  echo "Attempting to switch to 'root'."

  # Re-execute this script as 'root'.
  exec sudo "$0" "$@"

  # Due to the 'exec' command above, the below lines of code will not execute if the script succeeds running as 'root'.
  echo "Failed to switch to the 'root' user."
  exit 1

fi

# Check if exactly one argument was passed.
if [ "$#" -ne 1 ]; then

  # Print an error and exit.
  echo 'Usage: ./setup-fedora-nvidia.sh <install> OR <verify>'
  exit 1

fi

# Check if the argument is 'install'.
if [ "${1}" = 'install' ]; then

  # Install the required packages.
  echo 'Installing the required packages.'
  dnf install --refresh --offline --assumeyes akmod-nvidia xorg-x11-drv-nvidia-cuda xorg-x11-drv-nvidia-power vulkan xorg-x11-drv-nvidia-cuda-libs nvidia-vaapi-driver libva-utils vdpauinfo libva-nvidia-driver.i686 libva-nvidia-driver.x86_64

  # Switch to the open source kernel-space driver.
  echo 'Switching to the open-source kernel-space driver.'
  echo '%_with_kmod_nvidia_open 1' > '/etc/rpm/macros.nvidia-kmod'

  echo 'It is now strongly recommended to reboot using the command below'
  echo "'sudo dnf offline reboot'"

  echo "After rebooting, please run this same script with the only argument as 'verify'."

# Check if the argument is 'verify'.
elif [ "${1}" = 'verify' ]; then

  echo 'Waiting for the NVIDIA kernel module to be built.'
  while [ 0 -ne "$(modinfo -F version nvidia > /dev/null 2>&1; echo $?)" ]; do
 
    # Wait for a second.
    echo 'Waiting for 1 second.'
    sleep 1

  done

  echo "NVIDIA kernel module version: '$(modinfo -F version nvidia)'"
  echo "NVIDIA kernel module license: '$(modinfo -F license nvidia)'"

else

  # Print an error and exit.
  echo 'Usage: ./setup-fedora-nvidia.sh <install> OR <verify>'
  exit 1

fi
