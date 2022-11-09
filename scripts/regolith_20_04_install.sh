#!/usr/bin/env bash

# Register the Regolith public key to your local apt
wget -qO - https://regolith-desktop.org/regolith.key | sudo apt-key add -

# Add the repository URL to your local apt
echo deb "[arch=amd64] https://regolith-desktop.org/release-ubuntu-focal-amd64 focal main" | \
sudo tee /etc/apt/sources.list.d/regolith.list

# Update apt
sudo apt update
sudo apt install regolith-desktop
sudo apt install regolith-look-dracula
regolith-look set dracula
regolith-look refresh
sudo apt install regolith-compositor-picom-glx regolith-control-center regolith-ftue 
sudo apt remove regolith-i3-config regolith-i3-base-launchers regolith-i3-ilia regolith-i3-next-workspace regolith-i3-navigation regolith-i3-gaps-partial regolith-i3-default-style regolith-i3-workspace-config regolith-i3-resize -y
