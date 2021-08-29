"*****************************************************************************
" Vim-PLug core
"*****************************************************************************
call plug#begin('~/.config/nvim/plugged')
" Theme for neovim.
Plug 'Th3Whit3Wolf/space-nvim'
" file navigation inside a project
Plug 'nvim-lua/popup.nvim' " telescope dependency
Plug 'nvim-lua/plenary.nvim' " telescope dependency
Plug 'nvim-telescope/telescope.nvim'
" Windows and Tabs 
Plug 'szw/vim-maximizer' " maximizes the current buffer
" editing helpers
Plug 'tpope/vim-commentary' 
Plug 'unblevable/quick-scope'       
" run background jobs
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" git wrapper
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'  
" Programing languages
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'plasticboy/vim-markdown'
" Tests
Plug 'janko-m/vim-test'
" Repl
Plug 'jpalardy/vim-slime'
" Terminal 
Plug 'kassio/neoterm'
" LSP + DAP
Plug 'neoclide/coc.nvim', {'branch': 'release'} " TODO replace by native lsp later and reintroduce ale
Plug 'honza/vim-snippets'
Plug 'dense-analysis/ale'                       
Plug 'rafi/vim-venom'                           " to automatically activate python virtualenv
" visual-leader
Plug 'hecal3/vim-leader-guide'                  " TODO replace by which-key
" notes
Plug 'kristijanhusak/orgmode.nvim'
Plug 'akinsho/org-bullets.nvim'
Plug '~/.config/nvim/pack/tlbd'
call plug#end()

" Telescope 
lua require('my_telescope')
lua require('my_treesitter')
lua require('my_orgmode')
