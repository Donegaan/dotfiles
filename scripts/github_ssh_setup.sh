#!/usr/bin/env bash

ssh-keygen -t ed25519 -C "24252685+Donegaan@users.noreply.github.com" 
eval "$(ssh-agent -s)"
sh-add ~/.ssh/id_ed25519

gh auth login
