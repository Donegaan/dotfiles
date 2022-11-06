-Add regolith install
  - sudo apt install regolith-look-dracula
  - regolith-look set dracula
  - regolith-look refresh
  - sudo apt install regolith-compositor-picom-glx
  -sudo apt remove regolith-i3-base-launchers regolith-i3-ilia regolith-i3-navigation regolith-i3-gaps-partial regolith-i3-default-style regolith-i3-next-workspace regolith-i3-workspace-config regolith-i3-resize regolith-i3-session regolith-i3-config -y

- Could use regolith iso in future?

- Split up install conf into full install and just creating new links
  - Don't want to be generating ssh keys everytime or stuff like that
  - Make separate asdf plugin install script, don't use the dotbot plugin
    - add .tool_version file to dotfiles for default versions of things installed by asdf
    - asdf plugin-add github-cli rust

- Generate ssh key script and add it to github via github cli tool
    - ssh-keygen -t ed25519 -C "${EMAIL}" - ask for this at start of script
    - eval "$(ssh-agent -s)"
    - ssh-add ~/.ssh/id_ed25519
    - 

- Add firefox profile saver, I think there is an asdf one. 

- Add oh my zsh git clone commands to script
- Upload powerlevel10k config to dotfiles directory

- Set zsh as default shell
