"*****************************************************************************
" Vim-PLug core
"*****************************************************************************
call plug#begin('~/.config/nvim/pack/plug/start')
" Theme for neovim.
Plug 'Th3Whit3Wolf/space-nvim'
" Config helpers 
Plug 'svermeulen/vimpeccable'
" Dependencies of plugins
Plug 'nvim-lua/popup.nvim' " Popup libray
Plug 'nvim-lua/plenary.nvim' " No need to explain
Plug 'RishabhRD/popfix' " Popup library
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' } " UI library
Plug 'kyazdani42/nvim-web-devicons'

""""""""""""""""""""""""""""""""
"         Telescope            "
""""""""""""""""""""""""""""""""
Plug 'nvim-telescope/telescope.nvim' 

""""""""""""""""""""""""""""""""
"       Windows and Tabs       "
""""""""""""""""""""""""""""""""
Plug 'beauwilliams/focus.nvim' " auto resize windows

""""""""""""""""""""""""""""""""
"      Editing Helpers         "
""""""""""""""""""""""""""""""""
" Expands the use of . to repeat last commands
Plug 'tpope/vim-repeat'        
" Comments 
Plug 'b3nj5m1n/kommentary'     
" highlights jump options for f,F, t,T
Plug 'unblevable/quick-scope'  
" Dims all the parts of the buffer that are not in the current scope
Plug 'folke/twilight.nvim'     

""""""""""""""""""""""""""""""""
"    Run Background Jobs       "
""""""""""""""""""""""""""""""""
Plug 'tpope/vim-dispatch'             
Plug 'radenling/vim-dispatch-neovim' 

""""""""""""""""""""""""""""""""
"       Git integration        "
""""""""""""""""""""""""""""""""
Plug 'tpope/vim-fugitive' " TODO Is it usefull anymore ? 
" Magit implementation for neovim
Plug 'TimUntersberger/neogit'  
" Not sure yet what it does
Plug 'sindrets/diffview.nvim' " TODO configure

""""""""""""""""""""""""""""""""
"          Treesitter          "
""""""""""""""""""""""""""""""""
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

""""""""""""""""""""""""""""""""
"            LSP               "
""""""""""""""""""""""""""""""""
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'hrsh7th/nvim-compe'
Plug 'ray-x/navigator.lua'


""""""""""""""""""""""""""""""""
"            DAP               "
""""""""""""""""""""""""""""""""
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-telescope/telescope-dap.nvim'

""""""""""""""""""""""""""""""""
"            Tests             "
""""""""""""""""""""""""""""""""
Plug 'janko-m/vim-test'

""""""""""""""""""""""""""""""""
"        visual-leader         "
""""""""""""""""""""""""""""""""
Plug 'folke/which-key.nvim'

""""""""""""""""""""""""""""""""
" Notes                        "
""""""""""""""""""""""""""""""""
Plug 'kristijanhusak/orgmode.nvim'
Plug 'akinsho/org-bullets.nvim'

""""""""""""""""""""""""""""""""
" Terminal & Repl              "
""""""""""""""""""""""""""""""""
Plug 'kassio/neoterm' " Terminal wrappers and Repl support
 
""""""""""""""""""""""""""""""""
"   Programming languages      "
""""""""""""""""""""""""""""""""

" Markdown
Plug 'plasticboy/vim-markdown'

" Rust
Plug 'simrat39/rust-tools.nvim'
Plug 'Saecki/crates.nvim'

" Go 
Plug 'ray-x/go.nvim'
Plug 'edolphin-ydf/goimpl.nvim'

" Lua
Plug 'folke/lua-dev.nvim'

" Python
Plug 'rafi/vim-venom', { 'for': 'python' }


" Scala
Plug 'scalameta/nvim-metals' " TODO setup nvim metals for scala

" My plugins
call plug#end()

lua require("which-key").setup ()
lua require'nvim-web-devicons'.setup ()
lua require('my_telescope')
lua require('my_treesitter')
lua require('my_orgmode')
lua require("twilight").setup()
lua require("lsp_configs")
lua require("configs.rust")
lua require('kommentary.config').use_extended_mappings()
lua require("configs.keybindings")
lua require('neogit').setup()
