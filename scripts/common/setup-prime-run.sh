#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

echo "Installing a wrapper script called 'prime-run' into '/usr/bin'."
echo 'This wrapper can be used to execute a program passed as the argument using the dedicated NVIDIA GPU as shown below.'
echo 'prime-run some_program'

printf '#!/bin/sh\n\n# Set the required environment variables and execute the argument.\n__NV_PRIME_RENDER_OFFLOAD=1 __VK_LAYER_NV_optimus=NVIDIA_only __GLX_VENDOR_LIBRARY_NAME=nvidia "$@"' | sudo tee /usr/bin/prime-run > /dev/null

# Set the executable flag on the created file.
sudo chmod +x /usr/bin/prime-run

# Exit with a successful error code.
exit 0
