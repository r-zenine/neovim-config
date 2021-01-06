#!/bin/sh
pip3 install --user --upgrade pynvim
pip3 install --user --upgrade neovim-remote
sudo apt install -y nodejs npm
nvim -c "PlugInstall|q|q"

# YCMD configuration
# sudo apt install build-essential cmake vim-nox python3-dev nodejs
# python3 ./plugged/YouCompleteMe/install.py --rust-completer --go-completer --clang-completer
