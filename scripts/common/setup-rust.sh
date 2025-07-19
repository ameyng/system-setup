#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Initialize the list of targets to be installed.
targets_to_install='aarch64-apple-darwin,aarch64-linux-android,aarch64-pc-windows-msvc,aarch64-unknown-linux-gnu,aarch64-unknown-linux-musl,wasm32-unknown-unknown,x86_64-pc-windows-gnu,x86_64-pc-windows-msvc,x86_64-unknown-linux-gnu,x86_64-unknown-linux-musl'

# Initialize a sub-shell.
(
  echo "Installing 'rust' with the auto-detected toolchain and additional targets shown below:"

  # Set the IFS (internal field separator to a comma).
  IFS=','

  # Iterate over the targets to be installed and print them with a '-' prefix.
  for target_name in ${targets_to_install}; do echo "- ${target_name}"; done

  # Unset the used variables.
  unset target_name

)

# Install 'rust' with the above defined target list.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --target "${targets_to_install}"

# Unset the used variables.
unset targets_to_install

# Exit with a successful error code.
exit 0
