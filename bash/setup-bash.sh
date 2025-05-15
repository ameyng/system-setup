#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Get the path of the directory where this script is located.
script_directory_path="$(cd "$(dirname "${0}")" && pwd)"

# Initialize the current timestamp to be used for making backup files.
timestamp_now="$(date +"%d-%b-%Y-%I-%M-%S-%p")"

# Check if a 'bashrc.d' directory does not exist within this script's directory.
if [ ! -d "${script_directory_path}/bashrc.d" ]; then

  # Print an error and exit.
  echo "The directory '${script_directory_path}' does not contain a 'bashrc.d' directory to install!"
  exit 1

fi

# Check if a 'bashrc' file does not exist within this script's directory.
if [ ! -f "${script_directory_path}/bashrc" ]; then

  # Print an error and exit.
  echo "The directory '${script_directory_path}' does not contain a 'bashrc' file to install!"
  exit 1

fi

# Check if the file '${HOME}/.bashrc' is a symbolic link.
if [ -L "${HOME}/.bashrc" ]; then

  # Unlink it. 
  echo "${HOME}/.bashrc exists as a symbolic link, unlinking it."
  unlink "${HOME}/.bashrc"

# Otherwise, if it is a regular file.
elif [ -f "${HOME}/.bashrc" ]; then

  # Backup and disable the file by renaming it.
  echo "${HOME}/.bashrc exists, creating backup."
  mv -f "${HOME}/.bashrc" "${HOME}/.bashrc.backup.${timestamp_now}"

# Otherwise, if the file does not exist at all.
else

  # Do nothing.
  :

fi

# Check if the directory '${HOME}/.bashrc.d' is a symbolic link.
if [ -L "${HOME}/.bashrc.d" ]; then

  # Unlink it. 
  echo "${HOME}/.bashrc.d exists as a symbolic link, unlinking it."
  unlink "${HOME}/.bashrc.d"

# Otherwise, if it is a regular directory.
elif [ -d "${HOME}/.bashrc.d" ]; then

  # Backup and disable the directory by renaming it.
  echo "${HOME}/.bashrc.d exists, creating backup."
  mv -f "${HOME}/.bashrc.d" "${HOME}/.bashrc.d.backup.${timestamp_now}"

# Otherwise, if the directory does not exist at all.
else

  # Do nothing.
  :

fi

# Install the 'bashrc.d' directory from this script's directory into '${HOME}'.
echo "Installing '${script_directory_path}/bashrc.d' into ${HOME} as a symbolic soft-link."
ln -s "${script_directory_path}/bashrc.d" "${HOME}/.bashrc.d"

# Install the 'bashrc' file from this script's directory into '${HOME}'.
echo "Installing '${script_directory_path}/bashrc' into ${HOME} as a symbolic soft-link."
ln -s "${script_directory_path}/bashrc" "${HOME}/.bashrc"

# Print a message about reloading the shell session.
echo 'Please close and reopen the shell session for the changes to take effect.'
echo 'OR'
echo "Run the command 'source ${HOME}/.bashrc' for immediate effect."

# Unset the used variable.
unset script_directory_path
unset timestamp_now
