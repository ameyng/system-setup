#!/usr/bin/env bash

# The 'echo' statements above the commands are self-explanatory.

echo -e 'Installing the required packages.'
sudo dnf install gcc \
                 libgcc \
                 libgcc.i686 \
                 glibc-devel \
                 glibc-devel.i686 \
                 clang \
                 golang \
                 lua \
                 rust \
                 cargo \
                 clippy \
                 rust-src \
                 rustfmt