#!/usr/bin/env bash

# Get the path of the directory where this script is located.
script_directory_path="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Iterate over the '.conf' files in the directory where this script is located.
for config_file in ${script_directory_path}/*.conf; do

  # Check if the file being iterated over is valid.
  if [[ -f "${config_file}" ]]; then

    # Get the base name of the file i.e. extract the file name from the path.
    config_file_name="$(basename "${config_file}")"

    # Check if a file by the same name exists under '/etc/sysctl.d' and is a symbolic link.
    if [[ -L "/etc/sysctl.d/${config_file_name}" ]]; then

      # Unlink it.
      echo -e "'/etc/sysctl.d/${config_file_name}' exists as a symbolic link, unlinking it."
      sudo unlink "/etc/sysctl.d/${config_file_name}"

    # Otherwise, check if it is a regular file.
    elif [[ -f "/etc/sysctl.d/${config_file_name}" ]]; then

      # Backup and disable the file by renaming it.
      echo -e "'/etc/sysctl.d/${config_file_name}' exists, creating backup."
      sudo mv -f "/etc/sysctl.d/${config_file_name}" "/etc/sysctl.d/${config_file_name}.backup.$(date +"%d-%b-%Y-%I-%M-%S-%p")"

    # Otherwise, if the file does not exist at all.
    else

      # Do nothing.
      :

    fi

    # Unset the variable used.
    unset config_file_name

    # Copy the configuration file into the '/etc/sysctl.d' directory.
    echo -e "Installing '${config_file}' into '/etc/sysctl.d'"
    sudo cp "${config_file}" '/etc/sysctl.d'

  fi

done

# Unset the variables used.
unset config_file_name
unset script_directory_path
