#!/usr/bin/env bash

# Get the path of the directory where this script is located.
script_directory_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Check if a 'bashrc.d' directory does not exist within this script's directory.
if [[ ! -d "${script_directory_path}/bashrc.d" ]]; then

  # Print an error and exit.
  echo -e "The directory '${script_directory_path}' does not contain a 'bashrc.d' directory to install!"
  exit 1

fi

# Check if a 'bashrc' file does not exist within this script's directory.
if [[ ! -f "${script_directory_path}/bashrc" ]]; then

  # Print an error and exit.
  echo -e "The directory '${script_directory_path}' does not contain a 'bashrc' file to install!"
  exit 1

fi

# Check if the file '${HOME}/.bashrc' is a symbolic link.
if [[ -L "${HOME}/.bashrc" ]]; then

  # Unlink it. 
  echo -e "${HOME}/.bashrc exists as a symbolic link, unlinking it."
  unlink "${HOME}/.bashrc"

# Otherwise, if it is a regular file.
elif [[ -f "${HOME}/.bashrc" ]]; then

  # Backup and disable the file by renaming it.
  echo -e "${HOME}/.bashrc exists, creating backup."
  mv -f "${HOME}/.bashrc" "${HOME}/.bashrc.backup.$(date +"%d-%b-%Y-%I-%M-%S-%p")"

# Otherwise, if the file does not exist at all.
else

  # Do nothing.
  :

fi

# Check if the directory '${HOME}/.bashrc.d' is a symbolic link.
if [[ -L "${HOME}/.bashrc.d" ]]; then

  # Unlink it. 
  echo -e "${HOME}/.bashrc.d exists as a symbolic link, unlinking it."
  unlink "${HOME}/.bashrc.d"

# Otherwise, if it is a regular directory.
elif [[ -d "${HOME}/.bashrc.d" ]]; then

  # Backup and disable the directory by renaming it.
  echo -e "${HOME}/.bashrc.d exists, creating backup."
  mv -f "${HOME}/.bashrc.d" "${HOME}/.bashrc.d.backup.$(date +"%d-%b-%Y-%I-%M-%S-%p")"

# Otherwise, if the directory does not exist at all.
else

  # Do nothing.
  :

fi

# Install the 'bashrc.d' directory from this script's directory into '${HOME}'.
echo -e "Installing '${script_directory_path}/bashrc.d' into ${HOME} as a symbolic soft-link."
ln -s "${script_directory_path}/bashrc.d" "${HOME}/.bashrc.d"

# Install the 'bashrc' file from this script's directory into '${HOME}'.
echo -e "Installing '${script_directory_path}/bashrc' into ${HOME} as a symbolic soft-link."
ln -s "${script_directory_path}/bashrc" "${HOME}/.bashrc"

# Print a message about reloading the shell session.
echo -e "Please close and reopen the shell session for the changes to take effect.\nOR\nRun the command 'source ${HOME}/.bashrc' for immediate effect."

# Unset the used variable.
unset script_directory_path
