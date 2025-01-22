#!/usr/bin/env bash

# The 'echo' statements above the commands are self-explanatory.

echo -e "Replcaing the free variant of 'ffmpeg' with the non-free variant."
sudo dnf swap ffmpeg-free ffmpeg --allowerasing

echo -e 'Installing the packages required for enabling usage of other codecs in GStreamer applications.'
sudo dnf update @multimedia --setopt="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin