#!/bin/sh
git clone --depth 1 https://github.com/wbthomason/packer.nvim ~/.local/share/nvim/site/pack/packer/start/packer.nvim

pip3 install --user --upgrade pynvim
pip3 install --user --upgrade neovim-remote
nvim -c "PlugInstall|q|q"

# enable dev mode in MacOs to prevent the prompt for passeword everytime
sudo /usr/sbin/DevToolsSecurity -enable
sudo dscl . append /Groups/_developer GroupMembership $(whoami)

# install delve
go install github.com/go-delve/delve/cmd/dlv@latest
 
 
