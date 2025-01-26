#!/usr/bin/env bash

echo -e 'Enabling/installing the RPM Fusion free repository.'
sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm

echo -e 'Enabling/installing the RPM Fusion non-free repository.'
sudo dnf install https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

echo -e 'Enabling the Cisco OpenH264 repository.'
sudo dnf config-manager setopt fedora-cisco-openh264.enabled=1

echo -e 'Updating the AppStream metadata.'
sudo dnf update @core

echo -e 'Uninstalling unnecessary packages.'
sudo dnf autoremove