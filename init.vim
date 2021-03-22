"*****************************************************************************
" Vim-PLug core
"*****************************************************************************
call plug#begin('~/.config/nvim/plugged')
" Theme for neovim.
Plug 'colepeters/spacemacs-theme.vim'
" file navigation inside a project
Plug 'nvim-lua/popup.nvim' " telescope dependency
Plug 'nvim-lua/plenary.nvim' " telescope dependency
Plug 'nvim-telescope/telescope.nvim'
Plug 'kevinhwang91/rnvimr'  " ranger integration
" Windows and Tabs 
Plug 'szw/vim-maximizer' " maximizes the current buffer
Plug 'gcmt/taboo.vim' " provides helpers function for working with tabs 
" editing helpers
Plug 'tpope/vim-commentary' 
Plug 'mg979/vim-visual-multi' 
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
" Terminal 
Plug 'kassio/neoterm'
" Writing 
Plug 'reedes/vim-pencil'
Plug 'reedes/vim-lexical', {'do': 'LexMed'}
Plug 'dbmrq/vim-ditto'
" LSP + DAP
Plug 'neoclide/coc.nvim', {'branch': 'release'} " TODO replace by native lsp later and reintroduce ale
Plug 'honza/vim-snippets'
Plug 'dense-analysis/ale'                       
Plug 'puremourning/vimspector'                  " TODO configure for scala / go and c++
Plug 'rafi/vim-venom'                           " to automatically activate python virtualenv
" visual-leader
Plug 'hecal3/vim-leader-guide'                  " TODO replace by which-key
" neuron-nvim
Plug 'oberblastmeister/neuron.nvim'
" local telescope-bookmarks-vim
Plug '~/.config/nvim/pack/tlbd'
" jira integration
Plug 'n0v1c3/vira', { 'do': './install.sh' }
call plug#end()

" Telescope 
lua require('my_telescope')
lua require('my_treesitter')
lua require('my_neuron')
