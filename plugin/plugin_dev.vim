" Automatically reload the vim configuration when it's updated
augroup vimconfig
autocmd!
autocmd BufWritePost ~/.config/nvim/* :source $MYVIMRC
autocmd BufWritePost ~/.config/nvim/plugin/*.vim :source %
autocmd BufWritePost ~/.config/nvim/* echo "Reloaded vim configuration"
augroup END

augroup Lua_autoreload
autocmd!
autocmd BufWritePost *.lua :luafile %
augroup END


