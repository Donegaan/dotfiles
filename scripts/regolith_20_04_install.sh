#!/usr/bin/env bash

wget -qO - https://regolith-desktop.org/regolith.key | \
gpg --dearmor | sudo tee /usr/share/keyrings/regolith-archive-keyring.gpg > /dev/null
echo deb "[arch=amd64 signed-by=/usr/share/keyrings/regolith-archive-keyring.gpg] \
https://regolith-desktop.org/release-ubuntu-jammy-amd64 jammy main" | \
sudo tee /etc/apt/sources.list.d/regolith.list

sudo apt update
sudo apt install regolith-desktop -y
sudo apt upgrade

sudo apt install regolith-look-dracula -y
sudo apt install regolith-compositor-picom-glx regolith-control-center -y
sudo apt install i3xrocks-rofication i3xrocks-info i3xrocks-app-launcher i3xrocks-memory -y
sudo apt remove regolith-i3-gnome regolith-i3-i3xrocks regolith-i3-gaps-partial -y

-- Disable default lock screen manager
gsettings set org.gnome.gnome-flashback screensaver false
