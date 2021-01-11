#!/bin/sh
pip3 install --user --upgrade pynvim
pip3 install --user --upgrade neovim-remote
sudo apt install -y nodejs npm
nvim -c "PlugInstall|q|q"

# Vimspector configuration:
./plugged/vimspector/install_gadget.py --enable-python --enable-cpp --enable-rust --enable-go
