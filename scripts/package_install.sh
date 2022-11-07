#!/usr/bin/env bash

sudo apt-get update -y 
sudo apt-get install -y \
          git \
          curl \
          wget \
          zsh \
          htop \
          zip \
          unzip \
          gnome-tweaks \
          terminator 
sudo apt-get autoremove -y

# Install oh-my-zsh
if cd ~/.oh-my-zsh
then git pull;
else sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
fi

# Install oh-my-zsh plugins
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git ~/oh-my-zsh/custom/plugins/you-should-use
git clone https://github.com/zsh-users/zsh-autosuggestions ~/oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zdharma/fast-syntax-highlighting.git ~ZSH_CUSTOM/plugins/fast-syntax-highlighting
git clone https://github.com/mroth/evalcache ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/evalcache

# Install asdf
if cd ~/.asdf
then asdf update;
else git clone https://github.com/asdf-vm/asdf.git ~/.asdf;
fi

# Install fonts
if ! cd ~/.local/share/fonts/fonts then
# TODO: FIX THIS
echo "TESTING FONTS";
  #mkdir -p ~/.local/share/fonts
  #cd ~/.local/share/fonts && curl -fLo "Droid Sans Mono for Powerline Nerd Font Complete.otf" https://github.com/ryanoasis/nerd-fonts/raw/HEAD/patched-fonts/DroidSansMono/complete/Droid%20Sans%20Mono%20Nerd%20Font%20Complete.otf
fi

# Install lunarvim
if ! cd ~/.local/share/lunarvim
then LV_BRANCH='release-1.2/neovim-0.8' bash <(curl -s https://raw.githubusercontent.com/lunarvim/lunarvim/master/utils/installer/install.sh);
fi

if ! [[ "${SHELL}" == "/usr/bin/zsh" ]]
then chsh -s $(which zsh);
fi
