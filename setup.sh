#!/bin/sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
pip3 install --user --upgrade pynvim
pip3 install --user --upgrade neovim-remote
nvim -c "PlugInstall|q|q"
# download thesaurus for vim-lexical
curl https://raw.githubusercontent.com/zeke/moby/master/words.txt --output ./thesaurus/words.txt

# Vimspector configuration:
# ./plugged/vimspector/install_gadget.py --enable-python --enable-cpp --enable-rust --enable-go
# if [[ "$OSTYPE" == "linux-gnu"* ]]; then
#    mkdir -p ./plugged/vimspector/configurations/linux/scala
#    cp ./dap-adapters/coc-metals.json plugged/vimspector/configurations/linux/coc-metals.json
# elif [[ "$OSTYPE" == "darwin"* ]]; then
#    mkdir -p ./plugged/vimspector/configurations/macos/scala
#    cp ./dap-adapters/coc-metals.json plugged/vimspector/configurations/macos/coc-metals.json
# fi
