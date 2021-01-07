"*****************************************************************************
"" Vim-PLug core
"*****************************************************************************
call plug#begin('~/.config/nvim/plugged')
" Theme for neovim.
Plug 'dracula/vim'
" fuzzy file finder / file navigation inside a project
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-projectionist'
" editing helpers
Plug 'tpope/vim-unimpaired'
" run background jobs
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" git wrapper
Plug 'tpope/vim-fugitive'
" Programing languages
Plug 'rust-lang/rust.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
" Tests
Plug 'janko-m/vim-test'
" Linters
Plug 'w0rp/ale'
" Greping
Plug 'mhinz/vim-grepper'
" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" set leader to space
let mapleader=" "
" Edit vimr configuration file
nnoremap <Leader>ve :e $MYVIMRC<CR>
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
" Install plugins
nnoremap <Leader>vp :PlugInstall<CR>

" Buffers navigation
" next buffer
nnoremap <silent> <Leader>bp :bp<CR>
" previous buffer
nnoremap <silent> <Leader>bn :bn<CR>
" list buffers
nnoremap <silent> <Leader>bl :CtrlPBuffer<CR>
" delete buffer
nnoremap <silent> <Leader>bd :bdelete<CR>

" Window navigation
nnoremap <silent> <Leader>wj <C-W>j
nnoremap <silent> <Leader>wk <C-W>k
nnoremap <silent> <Leader>wl <C-W>l
nnoremap <silent> <Leader>wh <C-W>h

" Close window
nnoremap <silent> <Leader>wc <C-W>c
" Switch to alternate file
nnoremap <silent> <Leader>wa <C-^>
" Window Splits
nnoremap <silent> <Leader>ws :split<CR>
nnoremap <silent> <Leader>wv :vsplit<CR>

if has('nvim')
	tnoremap <silent> <Leader>wj <C-\><C-n><C-w>j
	tnoremap <silent> <Leader>wk <C-\><C-n><C-w>k
	tnoremap <silent> <Leader>wl <C-\><C-n><C-w>l
	tnoremap <silent> <Leader>wh <C-\><C-n><C-w>h
	tnoremap <silent> <Leader>wc <C-\><C-n><C-w>c
	tnoremap <silent> <Leader>wa <C-\><C-n><C-w>a
	tnoremap <silent> <Leader>ws <C-\><C-n>:split<CR>
	tnoremap <silent> <Leader>wv <C-\><C-n>:vsplit<CR>
endif

" configure ctrlP
nnoremap <silent> <Leader>pf :CtrlP<CR>
nnoremap <silent> <Leader>pp :CtrlPBookmarkDir<CR>
nnoremap <silent> <Leader>pI :CtrlPClearCache<CR>
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target/*     " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|.cargo|.sbt)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" Configure the linter
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

nnoremap <Leader>lf <Plug>(ale_first)
nnoremap <Leader>ll <Plug>(ale_last)
nnoremap <Leader>ln <Plug>(ale_next)
nnoremap <Leader>lp <Plug>(ale_previous)

" Configure current grep
let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'grep', 'ag']
" Search for the current word

" Grepping configuration
nnoremap <Leader>sw :Grepper -cword -noprompt<CR>

" Tests
" make the test result populate the quicklist
let test#strategy = "dispatch"
" Test current
nnoremap <silent> <Leader>tc :TestNearest<CR>
" Test current file 
nnoremap <silent> <Leader>tf :TestFile<CR>
" Test last 
nnoremap <silent> <Leader>tt :TestLast<CR>

" launch terminal
nnoremap <silent> <Leader>' :terminal<CR>
if has('nvim')
	" map ESC to return to normal mode in terminal mode
	tnoremap <Esc> <C-\><C-n>
	" send escape to program running in terminal using C-V esc
	tnoremap <C-v><Esc> <Esc>
	" distinguis terminal cursor and normal mode cursor
	highlight! link TermCursor Cursor
	highlight! TermCursorNC guibg=red guifg=white ctermbg=1 ctermfg=15
endif

"Ale configuration
let g:ale_disable_lsp=1

" make <cr> select the first completion item and confirm the completion when no item has been selected
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>"
"
" Use <tab> for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
" use ctrl-j and ctrl-k to navigate completions
inoremap <expr> <C-j> pumvisible() ? "\<C-n>" : "\<C-j>"
inoremap <expr> <C-k> pumvisible() ? "\<C-p>" : "\<C-k>"

" Font
set guifont="Cascadia Code:h15"
let g:ale_disable_lsp=1

" Disabling Persistent Undo for Temporary Files
augroup vimrc
autocmd!
autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

" rust autoformat on save
augroup rust
autocmd!
autocmd BufWritePost *rs RustFmt 
augroup END

" Automatically reload the vim configuration when it's updated
augroup vimconfig
autocmd!
autocmd BufWritePost ~/.config/nvim/* :source $MYVIMRC
autocmd BufWritePost ~/.config/nvim/* echo "Reloaded vim configuration"
augroup END

" Changes directory to the root of the repo when a file is open and registers the repository in the CtrlPBookmarkDir
augroup project_discovery
  autocmd!
  autocmd User Fugitive let dir_path = fnamemodify(fugitive#repo().dir(), ':h') | :execute 'cd' dir_path|:execute 'silent CtrlPBookmarkDirAdd!' dir_path
augroup END

" Project wide search 
let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'grep']
" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
nnoremap <Leader>sw :Grepper -cword -noprompt<CR>
nnoremap <Leader>ss :Grepper -cword -noprompt<CR>
" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

"" Setup an abrev to run grepper instead of grep
function! SetupCommandAlias(input, output)
exec 'cabbrev <expr> '.a:input
\ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
\ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias("grep", "GrepperGrep")

""" Fugitive setup
nnoremap <Leader>gg :Git<CR>

