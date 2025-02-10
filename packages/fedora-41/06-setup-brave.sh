#!/usr/bin/env bash

echo -e "Installing the 'dnf-plugins-core' package."
sudo dnf install dnf-plugins-core

echo -e 'Adding the Brave browser repository.'
sudo dnf config-manager addrepo --from-repofile='https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo'

echo -e 'Installing Brave browser.'
sudo dnf install brave-browser

echo -e 'Uninstalling unnecessary packages.'
sudo dnf autoremove
