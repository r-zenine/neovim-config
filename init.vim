"*****************************************************************************
" Vim-PLug core
"*****************************************************************************
lua require('plugins')
lua require("which-key").setup()
lua require('my_telescope')
lua require('my_treesitter')
lua require('my_orgmode').setup()
lua require("lsp_configs")
lua require("configs.rust")
lua require('kommentary.config').use_extended_mappings()
lua require("configs.keybindings")
lua require('neogit').setup()
