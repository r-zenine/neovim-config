silent! helptags ALL

syntax on

set hidden                    " Required to keep multiple buffers open in the background
set relativenumber            " display relative numbers
set number                    " displays the number of the current line
set nohlsearch                " Stop the highlighting for the 'hlsearch' option.
set noerrorbells              " no bells
set encoding=utf-8            " encoding utf-8
set pumheight=10              " Makes popup menu smaller
set noruler                   " show the cursor position all the time
set noshowcmd
set iskeyword+=-              " treat dash separated words as a word text object"
set iskeyword+=_              " treat hyphen separated words as a word text object"
set tabstop=4 softtabstop=4   " Insert 4 spaces for a tab
set shiftwidth=4              " Change the number of space characters inserted for indentation                        
set smarttab                  " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                 " replaces tabs with spaces 
set smartindent               " Makes indenting smart
set autoindent                " Copy indent from current line when inserting new one
set nowrap                    " dont wrap long lines
set smartcase
set incsearch
set termguicolors
set scrolloff=8
set updatetime=500            " Faster completion
set timeoutlen=250            " By default timeoutlen is 1000 ms
set clipboard=unnamedplus     " Copy paste between vim and everything else
set lazyredraw                " improve scrolling performance when navigating through large results
set colorcolumn=80
set inccommand=split
set nofoldenable

set background=dark
colorscheme space-nvim
" colorscheme aurora
let loaded_matchparen = 1

set guifont=Fira\ Code,Retina:h14

" Ignore temporary and build directory
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                    " For MacOSX/Linux
set wildignore+=*/plugged/*,*/node_modules/*,*.swp          " For vim config
set wildignore+=*/node_modules/*                            " For Node

set path+=stdpath('data')
" quick-scope
" Trigger a highlight in the appropriate direction when pressing these keys:
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']
"
let mapleader=" "
let maplocalleader=","


