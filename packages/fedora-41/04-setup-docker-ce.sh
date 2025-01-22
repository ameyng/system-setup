#!/usr/bin/env bash

# The 'echo' statements above the commands are self-explanatory.

echo -e 'Removing existing/older components if installed.'
sudo dnf remove docker docker-client docker-client-latest docker-common docker-latest docker-latest-logrotate docker-logrotate docker-selinux docker-engine-selinux docker-engine

echo -e "Installing the 'dnf-plugins-core' package."
sudo dnf install dnf-plugins-core

echo -e 'Adding the Docker CE repository.'
sudo dnf config-manager addrepo --from-repofile='https://download.docker.com/linux/fedora/docker-ce.repo'

echo -e 'Installing the required Docker CE packages.'
sudo dnf install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo -e "Enabling the Docker CE 'systemd' service."
sudo systemctl enable --now docker.service

echo -e "Enabling the containerd 'systemd' service."
sudo systemctl enable --now containerd.service