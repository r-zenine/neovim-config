"*****************************************************************************
" Vim-PLug core
"*****************************************************************************
lua require('plugins')
lua require("which-key").setup()
lua require('my_telescope')
lua require('my_treesitter')
lua require('my_orgmode').setup()
lua require'nvim-web-devicons'.setup {default = true;}

lua require("lsp_configs")
lua require("configs.rust")
lua require("configs.keybindings")
lua require('neogit').setup()
lua require('auto-session').setup()
lua require("harpoon").setup()
lua require("stabilize").setup()
