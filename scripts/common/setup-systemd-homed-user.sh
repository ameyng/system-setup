#!/bin/sh

# Exit if any unset variable is used/referenced.
set -u

homectl create \
        YOUR_USERNAME \
        --real-name=YOUR_FULL_NAME \
        --email-address=YOUR_EMAIL_ADDRESS \
        --image-path=DEVICE_NODE_OF_THE_DISK_TO_BE_USED \
        --fs-type=ext4 \
        --luks-pbkdf-hash-algorithm=sha3-512 \
        --luks-pbkdf-memory-cost=4294967296 \
        --luks-pbkdf-parallel-threads=4 \
        --luks-pbkdf-time-cost=32 \
        --luks-pbkdf-type=argon2id \
        --member-of=wheel \
        --storage=luks \
        --luks-extra-mount-options='relatime,lazytime,commit=60' \
        --luks-discard=yes \
        --luks-offline-discard=yes
