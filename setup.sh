#!/bin/bash

echo "Starting setup process..."
cd $HOME
# clone bashrc
echo "Cloning bashrc..."
ln -sF /home/$(USER)/.dotfiles/.bashrc ~/.bashrc

# Install dependencies
echo "Installing dependencies"
# nvm 
echo "nvm\n"
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
# pyenv
echo "pyenv\n"
curl -fsSL https://pyenv.run | bash
# bun
echo "bun\n"
curl -fsSL https://bun.sh/install | bash

source ~/.bashrc
echo "Complete installing dependencies"

# Install npm
echo "Installing nodeJS..."
nvm install node

# Clone neovim config
echo "Cloning neovim configs..."
if ! command -v nvim >/dev/null 2>&1
then
    echo "neovim could not be found"
    echo "Installing neovim 0.11.3 with tar"
    curl -fsSL https://github.com/neovim/neovim/releases/download/v0.11.3/nvim-linux-x86_64.tar.gz > nvim-linux-x86_64.tar.gz
    tar -xzvf nvim-linux-x86_64.tar.gz -C /usr/local/
    ln -sF /usr/local/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim
    echo "Download neovim complete!"
fi
ln -sF /home/$(USER)/.dotfiles/.config/nvim-nvchad/nvim ~/.config/

# Install starship
echo "Install starship..."
curl -sS https://starship.rs/install.sh | sh
ln -sf /home/$(USER)/.dotfiles/starship.toml ~/.config/
echo "Complete setup!"
