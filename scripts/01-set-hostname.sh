#!/usr/bin/env bash

DESIRED_HOSTNAME='G634JZ'

echo -e "Setting the hostname to '${DESIRED_HOSTNAME}'" 
hostnamectl hostname "${DESIRED_HOSTNAME}"

echo -e '\nIt is now STRONGLY RECOMMENDED to reboot!'
