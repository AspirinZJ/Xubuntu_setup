#!/bin/bash

set -e

wget -qO - https://raw.githubusercontent.com/linux-surface/linux-surface/master/pkg/keys/surface.asc \
    | gpg --dearmor | sudo dd of=/etc/apt/trusted.gpg.d/linux-surface.gpg

echo "deb [arch=amd64] https://pkg.surfacelinux.com/debian release main" \
	| sudo tee /etc/apt/sources.list.d/linux-surface.list

sudo apt update

sudo apt install linux-image-surface linux-headers-surface iptsd libwacom-surface
sudo systemctl enable iptsd

sudo apt install linux-surface-secureboot-mok
sudo update-grub

echo "~~~~~~~~~~~~REBOOT~~~~~~~~~~~~~"
