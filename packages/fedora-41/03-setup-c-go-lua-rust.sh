#!/usr/bin/env bash

echo -e 'Installing the required packages for C/C++ development.'
sudo dnf install gcc \
                 libgcc \
                 libgcc.i686 \
                 glibc-devel \
                 glibc-devel.i686 \
                 clang

echo -e 'Installing the required packages for Go development.'
sudo dnf install golang

echo -e 'Installing the required packages for Lua development.'
sudo dnf install lua

echo -e 'Installing the required packages for Rust development.'
sudo dnf install rust \
                 cargo \
                 clippy \
                 rust-src \
                 rustfmt

echo -e 'Removing unnecessary packages.'
sudo dnf autoremove