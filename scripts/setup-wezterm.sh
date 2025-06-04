#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Get the path of the directory where this script is located.
script_directory_path="$(cd "$(dirname "$0")" && pwd)"

# Check if the configuration file does not exist at the path.
if [ ! -f "${script_directory_path}/wezterm.lua" ]; then

  # Print an error and exit.
  echo "The directory '${script_directory_path}' does not contain a 'wezterm.lua' file to install!"
  exit 1

fi

# Check if the file '${HOME}/.wezterm.lua' is a symbolic link.
if [ -L "${HOME}/.wezterm.lua" ]; then

  # Unlink it.
  echo "'${HOME}/.wezterm.lua' exists as a symbolic link, unlinking it."
  unlink "${HOME}/.wezterm.lua"

# Otherwise, if it is a regular file.
elif [ -f "${HOME}/.wezterm.lua" ]; then

  # Backup and disable the file by renaming it.
  echo "'${HOME}/.wezterm.lua' exists, creating backup."
  mv -f "${HOME}/.wezterm.lua" "${HOME}/.wezterm.lua.backup.$(date +"%d-%b-%Y-%I-%M-%S-%p")"

# Otherwise, if the file does not exist at all.
else

  # Do nothing.
  :

fi

# Install the 'wezterm.lua' file from this script's directory into '${HOME}'.
echo "Installing '${script_directory_path}/wezterm.lua' into ${HOME} as a symbolic soft-link."
ln -s "${script_directory_path}/wezterm.lua" "${HOME}/.wezterm.lua"

# Unset the used variable.
unset script_directory_path
