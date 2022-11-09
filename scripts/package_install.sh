#!/usr/bin/env bash

sudo apt-get update -y && sudo apt-get upgrade -y
sudo apt-get install -y git curl wget zsh htop make cmake zip unzip gnome-tweaks build-essential terminator \
          autoconf bison patch build-essential rustc libssl-dev libyaml-dev libreadline6-dev \
          zlib1g-dev libgmp-dev libncurses5-dev libffi-dev libgdbm6 libgdbm-dev libdb-dev uuid-dev xsel
sudo apt-get autoremove -y

# Install oh-my-zsh
if cd ~/.oh-my-zsh
then git pull;
else sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install oh-my-zsh plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/.oh-my-zsh/custom/plugins/you-should-use
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/plugins/fast-syntax-highlighting
git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache

# Install asdf
if cd ~/.asdf
then asdf update;
else git clone https://github.com/asdf-vm/asdf.git ~/.asdf;
fi

# Install fonts
if ! cd ~/.local/share/fonts
then  mkdir -p ~/.local/share/fonts &&
  cd ~/.local/share/fonts && curl -fLo "JetBrains Mono Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf;
fi

if ! [[ "${SHELL}" == "/usr/bin/zsh" ]]
then chsh -s $(which zsh);
fi
