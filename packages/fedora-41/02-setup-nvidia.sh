#!/usr/bin/env bash

# The 'echo' statements above the commands are self-explanatory.

echo -e 'Installing the required packages.'
sudo dnf install akmod-nvidia \
                 xorg-x11-drv-nvidia-cuda \
                 xorg-x11-drv-nvidia-power \
                 vulkan \
                 xorg-x11-drv-nvidia-cuda-libs \
                 nvidia-vaapi-driver \
                 libva-utils \
                 vdpauinfo \
                 intel-media-driver \
                 libva-nvidia-driver.{i686,x86_64}