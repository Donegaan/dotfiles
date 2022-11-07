#!/usr/bin/env bash
function msg() {
  local text="$1"
  local div_width="80"
  printf "%${div_width}s\n" ' ' | tr ' ' -
  printf "%s\n" "$text"
}

function confirm() {
  local question="$1"
  while true; do
    msg "$question"
    read -p "[y]es or [n]o (default: no) : " -r answer
    case "$answer" in
      y | Y | yes | YES | Yes)
        return 0
        ;;
      n | N | no | NO | No | *[[:blank:]]* | "")
        return 1
        ;;
      *)
        msg "Please answer [y]es or [n]o."
        ;;
    esac
  done
}

./package_install.sh 
./asdf_install.sh
# Lunarvim install needs to happen after asdf install
./regolith_20_04_install.sh
if confirm "Do you want to create a new ssh key and upload it to GitHub?"; then
  ./github_ssh_setup.sh
fi
