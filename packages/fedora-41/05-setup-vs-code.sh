#!/usr/bin/env bash

# The 'echo' statements above the commands are self-explanatory.

echo -e 'Importing the required Microsoft signing key.'
sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc

echo -e 'Adding the Visual Studio Code repository.'
echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" | sudo tee /etc/yum.repos.d/vscode.repo > /dev/null

echo -e 'Updating the package repository details.'
dnf check-update

echo -e 'Installing Visual Studio Code.'
sudo dnf install code
