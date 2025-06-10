#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Check if the '~/.config/autostart' directory does not exist.
if [ ! -d "${HOME}/.config/autostart" ];

  # Create it.
  echo "Directory '${HOME}/.config/autostart' not found."
  mkdir -p "${HOME}/.config/autostart"
  echo "Create directory '${HOME}/.config/autostart'."

fi
