#!/usr/bin/env bash

echo -e 'Enabling the WezTerm COPR repository.'
sudo dnf copr enable wezfurlong/wezterm-nightly

echo -e 'Installing WezTerm.'
sudo dnf install wezterm

echo -e 'Uninstalling unnecessary packages.'
sudo dnf autoremove
