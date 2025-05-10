#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Get the ID of the current user.
current_user_id="$(id -u)"

# Check if the script is not running as 'root'.
if [ "${current_user_id}" -ne 0 ]; then

  echo "Script is not running as 'root'."
  echo "Attempting to switch to 'root'."

  # Re-execute this script as 'root'.
  exec sudo "$0" "$@"

  # Due to the 'exec' command above, the below lines of code will not execute if the script succeeds running as 'root'.
  echo "Failed to switch to the 'root' user."
  exit 1

# Otherwise, if the script is running as 'root'.
else

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
    dnf install --refresh --offline --assumeyes \
      akmod-nvidia \
      xorg-x11-drv-nvidia-cuda \
      xorg-x11-drv-nvidia-power \
      xorg-x11-drv-nvidia-cuda-libs \
      vulkan \
      libva-nvidia-driver.x86_64 \
      libva-nvidia-driver.i686 \
      nvidia-vaapi-driver \
      libva-utils \
      vdpauinfo

    # Switch to the open source kernel-space driver.
    echo 'Switching to the open-source kernel-space driver.'
    echo '%_with_kmod_nvidia_open 1' > '/etc/rpm/macros.nvidia-kmod'

    echo 'It is now strongly recommended to reboot using the command below'
    echo "'sudo dnf offline reboot'"

    echo "After rebooting, please run this same script with the only argument as 'verify'."

  # Check if the argument is 'verify'.
  elif [ "${1}" = 'verify' ]; then

    # Run an infinite loop.
    while true; do

      # Initialize a variable that stores whether the NVIDIA kernel module is built.
      is_nvidia_kernel_module_built="$(modinfo -F version nvidia > /dev/null 2>&1; echo $?)"

      # Check if the NVIDIA kernel module is built.
      if [ 0 -eq "${is_nvidia_kernel_module_built}" ]; then

        # Break the loop.
        break

      else

        # Wait a second for it to be built.
        echo "Waiting for the 'NVIDIA' kernel module to be built."
        sleep 1

      fi

    done

    # Unset the variables used.
    unset is_nvidia_kernel_module_built

    # Get the version and license of the NVIDIA kernel module.
    nvidia_kernel_module_version="$(modinfo -F version nvidia)"
    nvidia_kernel_module_license="$(modinfo -F license nvidia)"
    echo "'NVIDIA' kernel module version: ${nvidia_kernel_module_version}"
    echo "'NVIDIA' kernel module license: ${nvidia_kernel_module_license}"

    # Unset the variables used.
    unset nvidia_kernel_module_version
    unset nvidia_kernel_module_license

  else

    # Print an error and exit.
    echo 'Usage: ./setup-fedora-nvidia.sh <install> OR <verify>'
    exit 1

  fi

fi

# Unset the variables used.
unset current_user_id