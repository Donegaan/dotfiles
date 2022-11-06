#!/usr/bin/env bash

# Take email as arg

ssh-keygen -t ed25519 -C "${EMAIL}" - ask for this at start of script
eval "$(ssh-agent -s)"
sh-add ~/.ssh/id_ed25519

gh auth login
