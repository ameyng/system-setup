#!/usr/bin/env bash

echo -e 'Updating the system with bug fixes and security patches if any'
sudo dnf upgrade --offline --refresh --security --bugfix --assumeyes

echo -e 'It is now strongly recommended to reboot using the command below'
echo -e "'sudo dnf offline reboot'"
