#!/bin/bash

echo "Starting setup process..."
cd $HOME
echo "Checking OS..."
OS=$(grep -iE ^_id= /etc/os-release | awk -F '=' '{print $2}')
echo "Detected OS: $OS"
echo "Creating directories..."
mkdir -p .config
mkdir -p $HOME/.local/bin/
# clone bashrc
echo "Cloning bashrc..."
read -p ".bashrc file will be removed! Are you sure you want to continue? (Y/n) " yn
case $yn in
  [Yy]* ) rm $HOME/.bashrc;ln -sF $HOME/.dotfiles/.bashrc ~/.bashrc;break;;
  [Nn]* ) echo "Exiting...";exit;;
  * ) rm $HOME/.bashrc;ln -sF $HOME/.dotfiles/.bashrc ~/.bashrc;;
esac

# Install dependencies
echo "Installing dependencies..."
# nvm 
echo "nvm"
curl -s -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash > /dev/null 2>&1
# pyenv
echo "pyenv"
curl -fsSL https://pyenv.run | bash > /dev/null 2>&1
# bun
echo "bun"
curl -fsSL https://bun.sh/install | bash > /dev/null 2>&1

source $HOME/.bashrc
echo "Complete installing dependencies"

# Install npm
echo "Installing nodeJS..."
export NVM_DIR=$HOME/.nvm
source $NVM_DIR/nvm.sh
nvm install node

# Clone neovim config
echo "Cloning neovim configs..."
if ! command -v nvim >/dev/null 2>&1
then
    echo "neovim could not be found"
    echo "Installing neovim 0.11.3 with tar"
    curl -fsSL https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz > nvim-linux-x86_64.tar.gz
    tar -xzf nvim-linux-x86_64.tar.gz -C $HOME/.local/
    ln -sF $HOME/.local/nvim-linux-x86_64/bin/nvim $HOME/.local/bin/nvim
    echo "Download neovim complete!"
fi
ln -sF $HOME/.dotfiles/.config/nvim-nvchad/nvim ~/.config/

# Install starship
echo "Install starship..."
curl -sS https://starship.rs/install.sh | sh -s -- -b ~/.local/bin -y > /dev/null 2>&1
ln -sf $HOME/.dotfiles/starship.toml $HOME/.config/
echo "Complete setup!"
