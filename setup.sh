#!/bin/sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

pip3 install --user --upgrade pynvim
pip3 install --user --upgrade neovim-remote

# Installing third party dependencies
brew install luarocks stylua stow semgrep
luarocks install --server=https://luarocks.org/dev luaformatter

nvim -c "PackerSync|q|q"

# enable dev mode in MacOs to prevent the prompt for passeword everytime
sudo /usr/sbin/DevToolsSecurity -enable
sudo dscl . append /Groups/_developer GroupMembership $(whoami)

# install go dev dependencies
go install github.com/go-delve/delve/cmd/dlv@latest
go install mvdan.cc/gofumpt@latest

 
 
