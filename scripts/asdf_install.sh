#!/usr/bin/env bash

set -ux

# Install command-line tools using asdf.

if ! which asdf &>/dev/null; then
  echo "test"
	git clone https://github.com/asdf-vm/asdf.git "$HOME/.asdf"
	(
		cd "$HOME/.asdf" &&
			git checkout "$(git describe --abbrev=0 --tags)"
	)
fi

asdf update

function install_asdf_package() {
	local package_name="$1"
	local global="${2:-true}"
	local version="${3:-}"
	local plugin_url="${4:-}"

	if [ -n "$plugin_url" ]; then
		asdf plugin add "${package_name}" "${plugin_url}"
	else
		asdf plugin add "${package_name}"
	fi
}

asdf_tools=(
  "github-cli"
  "bat"
  "ripgrep"
  "difftastic"
  "fd"
  - plugin: nodejs
  - plugin: ruby
    global: 2.6.1
    versions:
      - 2.6.1
      - 2.7.0
      - 2.7.5
  - plugin: neovim
    url: https://github.com/richin13/asdf-neovim.git
    global: stable
    versions:
      - stable
  - plugin: zoxide
    url: https://github.com/nyrst/asdf-zoxide.git
  - plugin: fzf 
    url: https://github.com/kompiro/asdf-fzf.git
)

for tool in "${asdf_tools[@]}"; do
	install_asdf_package $tool
done

asdf install
