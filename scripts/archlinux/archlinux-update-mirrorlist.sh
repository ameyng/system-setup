#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Initialize a variable to check if the program 'reflector' is installed.
is_reflector_installed="$(command -v reflector > /dev/null 2>&1; echo $?)"

# Check if the 'reflector' binary is not available in 'PATH'.
if [ 0 -ne "${is_reflector_installed}" ]; then

  # Unset the variables used.
  unset is_reflector_installed

  # Print an error and exit.
  echo "The program 'reflector' is not installed."
  exit 1

# Otherwise, if the 'reflector' program is installed properly.
else

  # Initialize the current timestamp.
  sTimestamp="$(date +%Y-%m-%d-%Hh-%Mm-%Ss-%p-%Z)"

  # Check if the existing '/etc/pacman.d/mirrorlist' file exists.
  if [ -f '/etc/pacman.d/mirrorlist' ]; then

    echo "Backing up existing '/etc/pacman.d/mirrorlist'."
    sudo cp -v /etc/pacman.d/mirrorlist /etc/pacman.d/mirrorlist-"${sTimestamp}".backup

  fi

  # Unset the variables used.
  unset sTimestamp

  # Fetch the latest, secure, reasonably in-sync mirrorlist and sort it by download rate.
  sudo reflector \
       --save /etc/pacman.d/mirrorlist \
       --sort rate \
       --delay 1 \
       --protocol https \
       --ipv4

fi

# Unset the variables used.
unset is_reflector_installed

# Exit with a successful error code.
exit 0
