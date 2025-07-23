#!/bin/sh

# Exit on any error.
# Exit if any unset variable is used/referenced.
set -eu

echo ''
echo "Setting up the 'Brave Browser' repository."
sudo dnf config-manager addrepo --from-repofile=https://brave-browser-rpm-release.s3.brave.com/brave-browser.repo

echo ''
echo "Setting up the 'WezTerm Nightly' COPR repository."
sudo dnf copr enable --assumeyes wezfurlong/wezterm-nightly

echo ''
echo "Setting up the 'Docker Community Edition' repository."
sudo dnf config-manager addrepo --from-repofile=https://download.docker.com/linux/fedora/docker-ce.repo

echo ''
echo "Setting up the 'Google Chrome' repository."
sudo dnf config-manager setopt google-chrome.enabled=1

# Exit with a successful error code.
exit 0
