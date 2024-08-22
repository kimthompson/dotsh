#!/bin/bash

# update everything
sudo apt update -y
export DEBIAN_FRONTEND=noninteractive
sudo -E apt-get -o Dpkg::Options::="--force-confold" -o Dpkg::Options::="--force-confdef" dist-upgrade -q -y --allow-downgrades --allow-remove-essential --allow-change-held-packages

# install homebrew for some fancier packages that are difficult to keep updated via apt
NONINTERACTIVE=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# install my most beloved tools
NONINTERACTIVE=1 brew install fd ripgrep zsh tmux lazygit neovim neofetch starship

mkdir .config
cd .config || exit
mkdir nvim
cd .. || exit
git clone https://github.com/kimthompson/dotsh
cp dotsh/.tmux.conf ~/.tmux.conf
cp dotsh/.zshrc ~/.zshrc
cp -r dotsh/.config/nvim ~/.config/nvim
rm -rf dotsh
chsh zsh
