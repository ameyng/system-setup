#!/usr/bin/env bash

# Check if exactly one argument was passed.
if [[ "$#" -ne 1 ]]; then

  # Print an error and exit.
  echo -e 'Usage: ./setup-secure-boot <phase-1> OR <phase-2>'
  exit 1

fi

# Check if the argument is 'phase-1'.
if [[ "${1}" == 'phase-1' ]]; then

  # Install the required packages.
  echo -e 'Installing the required packages.'
  sudo dnf install --refresh --offline --assumeyes kmodtool akmods mokutil openssl
  echo -e 'It is now strongly recommended to reboot using the command below'
  echo -e "'sudo dnf offline reboot'"


# Check if the argument is 'phase-2'.
elif [[ "${1}" == 'phase-2' ]]; then

else

  # Print an error and exit.
  echo -e 'Usage: ./setup-secure-boot <phase-1> OR <phase-2>'
  exit 1

fi

# Install the required packages for secure boot key generation and import.
echo -e 'Installing the required packages for generating and importing keys for secure boot.'
sudo dnf install --refresh --assumeyes kmodtool akmods mokutil openssl

