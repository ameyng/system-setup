# Prepend various directories to the 'PATH' variable.

# Exit on any error.
# Exit if any unset variable is used/referenced.
# set -eu

# '~/.local/bin'.
fn_prepend_to_path "${HOME}/.local/bin"

# '~/bin'.
fn_prepend_to_path "${HOME}/bin"

# Golang.
fn_prepend_to_path '/usr/local/go/bin'

# Cargo i.e. Rust.
fn_prepend_to_path "${HOME}/.cargo/bin"
