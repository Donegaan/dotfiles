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
"bat"
"difftastic"
"fd"
"fzf"
"github-cli"
"neovim"
"nodejs"
"ripgrep"
"ruby"
"zoxide"
)

for tool in "${asdf_tools[@]}"; do
	install_asdf_package $tool
done

asdf install
