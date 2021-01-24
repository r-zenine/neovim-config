"*****************************************************************************
" Vim-PLug core
"*****************************************************************************
call plug#begin('~/.config/nvim/plugged')
" Theme for neovim.
Plug 'colepeters/spacemacs-theme.vim'
" fuzzy file finder / file navigation inside a project
Plug 'nvim-lua/popup.nvim' 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'kevinhwang91/rnvimr'  " ranger integration
" Windows and Tabs 
Plug 'szw/vim-maximizer'
Plug 'gcmt/taboo.vim'
" Session 
Plug 'mbbill/undotree'      
" editing helpers
Plug 'tpope/vim-unimpaired' " TODO learn + configure keybindings
Plug 'tpope/vim-commentary' " TODO learn + configure keybindings
Plug 'tpope/vim-surround'   " TODO learn + configure keybindings
Plug 'unblevable/quick-scope'       
" run background jobs
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" git wrapper
Plug 'tpope/vim-fugitive'   " TODO learn well and integrate in workflow
Plug 'APZelos/blamer.nvim'  
" Programing languages
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Tests
Plug 'janko-m/vim-test'
" Terminal 
Plug 'kassio/neoterm'
" LSP + DAP
Plug 'neoclide/coc.nvim', {'branch': 'release'} " TODO replace by native lsp later and reintroduce ale
Plug 'metakirby5/codi.vim'
Plug 'puremourning/vimspector'                  " TODO configure for scala / go and c++
" visual-leader
Plug 'hecal3/vim-leader-guide'                  " TODO replace by which-key
" local telescope-bookmarks-vim
Plug '~/.config/nvim/pack/tlbd'
call plug#end()

" Telescope 
lua require('my_telescope')
lua require('my_treesitter')



