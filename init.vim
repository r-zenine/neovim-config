"*****************************************************************************
" Vim-PLug core
"*****************************************************************************
call plug#begin('~/.config/nvim/plugged')
" Theme for neovim.
Plug 'Th3Whit3Wolf/space-nvim'
Plug 'bfredl/nvim-luadev'
" Config helpers 
Plug 'svermeulen/vimpeccable'
" file navigation inside a project
Plug 'nvim-lua/popup.nvim' " telescope dependency
Plug 'nvim-lua/plenary.nvim' " telescope dependency
Plug 'RishabhRD/popfix' " dependency for lsp-utils
" Telescope
Plug 'nvim-telescope/telescope.nvim'
" Windows and Tabs 
Plug 'szw/vim-maximizer' " maximizes the current buffer
Plug 'beauwilliams/focus.nvim' " auto resize windows
" editing helpers
Plug 'tpope/vim-repeat'
Plug 'b3nj5m1n/kommentary' " comments 
Plug 'unblevable/quick-scope' " highlights jump options for f,F, t,T
Plug 'folke/twilight.nvim' 
" run background jobs
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" git wrapper
Plug 'tpope/vim-fugitive' " TODO change with magit
Plug 'TimUntersberger/neogit'
"
" Treesitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"
"" LSP 
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'nvim-lua/completion-nvim' " TODO replace by comp.nvim
"
""" Code navigation
Plug 'ray-x/guihua.lua', {'do': 'cd lua/fzy && make' } " dependency
Plug 'ray-x/navigator.lua'

"" Linters
Plug 'kyazdani42/nvim-web-devicons'

" DAP
Plug 'mfussenegger/nvim-dap'
Plug 'theHamsta/nvim-dap-virtual-text'
Plug 'rcarriga/nvim-dap-ui'
Plug 'nvim-telescope/telescope-dap.nvim'

" Tests
Plug 'janko-m/vim-test'
Plug 'rcarriga/vim-ultest'

" visual-leader
Plug 'folke/which-key.nvim'

" notes
Plug 'kristijanhusak/orgmode.nvim'
Plug 'akinsho/org-bullets.nvim'

" Terminal 
Plug 'kassio/neoterm'

" Programming languages specifics
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
Plug 'rafi/vim-venom'                           " to automatically activate python virtualenv
" My plugins
Plug '~/.config/nvim/pack/tlbd'
call plug#end()

" Telescope 
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
