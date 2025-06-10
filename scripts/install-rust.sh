#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

# Initialize the list of targets to be installed.
targets_to_install='aarch64-apple-darwin aarch64-linux-android aarch64-pc-windows-msvc aarch64-unknown-linux-gnu aarch64-unknown-linux-musl wasm32-unknown-emscripten wasm32-unknown-unknown wasm32-wasip1 wasm32-wasip1-threads wasm32-wasip2 wasm32v1-none x86_64-linux-android x86_64-pc-windows-gnu x86_64-pc-windows-msvc x86_64-unknown-linux-gnu x86_64-unknown-linux-musl'

# Initialize an empty variable to store the target parameter string.
targets_to_install_param=''

# Install 'rust' with the auto-detected target as well as the above defined targets.
echo "Installing 'rust' with the auto-detected toolchain and additional targets shown below:"
for target_name in ${targets_to_install}; do echo "- ${target_name}"; done

# Initialize the final parameter string to be passed to the 'rust' installation script.
for target_name in ${targets_to_install}; do targets_to_install_param="${targets_to_install_param},${target_name}"; done

# Unset the used variables.
unset targets_to_install
unset target_name

# Install 'rust' with the above defined options.
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y --no-modify-path --default-toolchain stable --target "${targets_to_install_param}"

# Unset the used variables.
unset targets_to_install_param
