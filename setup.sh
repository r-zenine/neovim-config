#!/bin/sh
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
pip3 install --user --upgrade pynvim
pip3 install --user --upgrade neovim-remote
nvim -c "PlugInstall|q|q"

# download thesaurus for vim-lexical
curl https://raw.githubusercontent.com/zeke/moby/master/words.txt --output ./thesaurus/words.txt

# enable dev mode in MacOs to prevent the prompt for passeword everytime
sudo /usr/sbin/DevToolsSecurity -enable
sudo dscl . append /Groups/_developer GroupMembership $(whoami)

# install delve
go install github.com/go-delve/delve/cmd/dlv@latest
 
 
