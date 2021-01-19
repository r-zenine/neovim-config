"*t****************************************************************************
"" Vim-PLug core
"*****************************************************************************
call plug#begin('~/.config/nvim/plugged')
" Theme for neovim.
Plug 'colepeters/spacemacs-theme.vim'
" fuzzy file finder / file navigation inside a project
Plug 'nvim-lua/popup.nvim' 
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ctrlpvim/ctrlp.vim'   " TODO get rid of it soon.
" Session 
Plug 'mbbill/undotree'      " TODO introduce in workflow or get rid of it.
" Windows 
Plug 'szw/vim-maximizer'    " TODO maybe remove
" editing helpers
Plug 'tpope/vim-unimpaired' " TODO learn + configure keybindings
Plug 'tpope/vim-commentary' " TODO learn + configure keybindings
Plug 'tpope/vim-surround'   " TODO learn + configure keybindings
" run background jobs
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" git wrapper
Plug 'tpope/vim-fugitive'   " TODO learn well and integrate in workflow
Plug 'APZelos/blamer.nvim'  
Plug 'pwntester/octo.nvim'  " TODO introduce in workflow or remove
" Programing languages
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
" Tests
Plug 'janko-m/vim-test'     " Would be nice to configure it for scala
" Grep and replace
Plug 'ChristianChiarulli/far.vim'               " TODO configure and learn
" LSP + DAP
Plug 'neoclide/coc.nvim', {'branch': 'release'} " TODO replace by native lsp later and reintroduce ale
Plug 'puremourning/vimspector'                  " TODO configure for scala / go and c++
" Note Taking
Plug 'oberblastmeister/neuron.nvim'             " TODO learn
" visual-leader
Plug 'hecal3/vim-leader-guide'                  " TODO replace by which-key
call plug#end()


syntax on

set hidden                              " Required to keep multiple buffers open in the background
set relativenumber                      " display relative numbers
set number                              " displays the number of the current line
set nohlsearch                          " Stop the highlighting for the 'hlsearch' option.
set noerrorbells                        " no bells
set encoding=utf-8                      " encoding utf-8
set pumheight=10                        " Makes popup menu smaller
set ruler                               " show the cursor position all the time
set iskeyword+=-                      	" treat dash separated words as a word text object"
set iskeyword+=_                      	" treat hyphen separated words as a word text object"
set tabstop=4 softtabstop=4             " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation                        
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " replaces tabs with spaces 
set smartindent                         " Makes indenting smart
set autoindent                          " Copy indent from current line when inserting new one
set nowrap                              " dont wrap long lines
set smartcase
set incsearch
set termguicolors
set scrolloff=8
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus               " Copy paste between vim and everything else
set lazyredraw                          " improve scrolling performance when navigating through large results

set background=dark
colorscheme spacemacs-theme

"" persistent undo 
set undodir=~/.cache/nvim/undo
set noswapfile
set nobackup
set nowritebackup
set undofile

" Define prefix dictionary
" " Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Ignore temporary and build directory
" TODO move to ftplugins
set wildignore+=*/tmp/*,*.so,*.swp,*.zip                    " For MacOSX/Linux
set wildignore+=*/plugged/*,*/node_modules/*,*.swp          " For vim config
set wildignore+=*/.bloop/*,*/.metals/*,*/target/*,*class    " For Scala
set wildignore+=*/.cargo/*,*/target/*                       " For Rust
set wildignore+=*.pyc,*/.pyenv/*                            " For Python 
set wildignore+=*/node_modules/*                            " For Node

" terminal mode
if has('nvim')
	" map ESC to return to normal mode in terminal mode
	tnoremap <Esc> <C-\><C-n>
	" send escape to program running in terminal using C-V esc
	tnoremap <C-v><Esc> <Esc>
	" distinguis terminal cursor and normal mode cursor
	highlight! link TermCursor Cursor
	highlight! TermCursorNC guibg=lightblue guifg=white ctermbg=1 ctermfg=15
endif

" maximizer
let g:maximizer_set_default_mapping = 1

" Blamer 
let g:blamer_enabled = 0

" Telescope 
lua << EOF
require('telescope').setup{
    defaults = {
      shorten_path = true,
      file_sorter = require'telescope.sorters'.get_fzy_sorter,
    },
}
EOF

" treesitter configuration
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"rust", "go", "python", "rust", "scala", "yaml", "json", "java", "cpp"}, -- one of "all", "maintained" (parsers with maintainers), or a list of languages
  highlight = {
    enable = true,              -- false will disable the whole extension
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = "grc",
      node_decremental = "grm",
    },
  },
  indent = {
    enable = true
  },
}
EOF

" vim-tests
let test#strategy = "dispatch"

" Vimspector
let g:vimspector_install_gadgets = ['vscode-python', 'vscode-go', 'CodeLLDB']

" neuron configuration
if (executable('neuron') > 0)
lua <<EOF
-- these are all the default values
require'neuron'.setup {
    virtual_titles = true,
    mappings = true,
    run = nil, -- function to run when in neuron dir
    neuron_dir = "~/notes", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
    leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
}
EOF
endif

let g:lmap =  {}
" set leader to space
let mapleader=" "
"
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

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

call leaderGuide#register_prefix_descriptions("<Space>", "g:lmap")
nnoremap <silent> <leader> :<c-u>LeaderGuide '<Space>'<CR>
vnoremap <silent> <leader> :<c-u>LeaderGuideVisual '<Space>'<CR>

" Edit vimr configuration file
let g:lmap.v = { 'name' : 'Vim Config' }
nnoremap <Leader>ve :e $MYVIMRC<CR>
let g:lmap.v.e = [':e $MYVIMRC', 'Open vimrc']
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
let g:lmap.v.r = [':source $MYVIMRC', 'Reload vim config']
" Install plugins
nnoremap <silent><Leader>vp :PlugInstall\| :UpdateRemotePlugins<CR><CR>
let g:lmap.v.p = [':PlugInstall', 'Install plugins']

" Buffers navigation
let g:lmap.b = { 'name' : 'Buffers' }
" next buffer
nnoremap <silent> <Leader>bp :bp<CR>
let g:lmap.b.p = [':bp', 'Previous Buffer']
" previous buffer
nnoremap <silent> <Leader>bn :bn<CR>
let g:lmap.b.n = [':bn', 'Next Buffer']
" list buffers
nnoremap <silent> <Leader>bl :Telescope buffers<CR>
let g:lmap.b.l = [':Telescope buffers', 'List buffers']
" delete buffer
nnoremap <silent> <Leader>bd :bdelete<CR>
let g:lmap.b.d = [':bdelete', 'Delete buffer']

" Window navigation
let g:lmap.w = { 'name' : 'Window' }
nnoremap <silent> <Leader>wj <C-W>j
let g:lmap.w.j = ['<C-W>j', 'Window down']
nnoremap <silent> <Leader>wk <C-W>k
let g:lmap.w.k = ['<C-W>k', 'Window Up']
nnoremap <silent> <Leader>wl <C-W>l
let g:lmap.w.l = ['<C-W>l', 'Window left']
nnoremap <silent> <Leader>wh <C-W>h
let g:lmap.w.h = ['<C-W>h', 'Window Right']

" Close window
nnoremap <silent> <Leader>wc <C-W>c
let g:lmap.w.c = ['<C-W>c', 'Close Window']
" Window Splits
nnoremap <silent> <Leader>ws :split<CR>
let g:lmap.w.s = [':split', 'Split']
nnoremap <silent> <Leader>wv :vsplit<CR>
let g:lmap.w.v = [':vsplit', 'Vertical Split']

nnoremap <Leader>wm :MaximizerToggle<CR>
let g:lmap.w.m = ['MaximizerToggle', 'Maximize Window']

if has('nvim')
	tnoremap <silent> <Leader>wj <C-\><C-n><C-w>j
	tnoremap <silent> <Leader>wk <C-\><C-n><C-w>k
	tnoremap <silent> <Leader>wl <C-\><C-n><C-w>l
	tnoremap <silent> <Leader>wh <C-\><C-n><C-w>h
	tnoremap <silent> <Leader>wc <C-\><C-n><C-w>c
	tnoremap <silent> <Leader>ws <C-\><C-n>:split<CR>
	tnoremap <silent> <Leader>wv <C-\><C-n>:vsplit<CR>
endif

" Project
let g:lmap.p = { 'name' : 'Project' }
nnoremap <silent> <Leader>pf :Telescope find_files<CR>
let g:lmap.p.f = [':Telescope find_files', 'Find file']
nnoremap <silent> <Leader>pp :CtrlPBookmarkDir<CR>
let g:lmap.p.p = [':CtrlPBookmarkDir', 'Open project']
nnoremap <silent> <Leader>pI :CtrlPClearCache<CR>
let g:lmap.p.I = [':CtrlPClearCache', 'Clear cache']
" Project/Sessions
let g:lmap.p.s = { 'name' : 'Session' }
nnoremap <Leader>psl :source Session.vim<CR>
let g:lmap.p.s.l = [':source Session.vim', 'load session']
nnoremap <Leader>pss :mksession!<CR>
let g:lmap.p.s.s = [':mksession!', 'Save session']

let g:lmap.l = { 'name' : 'Linter' }
nnoremap <Leader>lf :call CocAction('diagnosticFirst')<CR>
let g:lmap.l.f = [':call CocAction(''diagnosticFirst'')', 'First linter error']
nnoremap <Leader>ll :call CocAction('diagnosticLast')<CR>
let g:lmap.l.l = [':call CocActionr(''diagnosticLast'')', 'Last linter error']
nnoremap <Leader>ln :call CocAction('diagnosticNext')<CR>
let g:lmap.l.n = [':call CocAction(''diagnosticNext'')', 'Next linter error']
nnoremap <Leader>lp :call CocAction('diagnosticPrevious')<CR>
let g:lmap.l.p = [':call CocAction(''diagnosticPrevious'')', 'Previous linter error']
nnoremap <Leader>ld :CocList diagnostics<CR>
let g:lmap.l.d = [':CocList diagnostics', 'Diagnostics list']

" Search for the current word
let g:lmap.s = { 'name' : 'Search' }
nnoremap <Leader>sp :Telescope live_grep<CR>
let g:lmap.s.w = [':Telescope live_grep', 'Search in project']
nnoremap <Leader>sw :Telescope grep_string<CR>
let g:lmap.s.w = [':Telescope grep_string', 'Search current string']

" Tests
" Test current
let g:lmap.t = { 'name' : 'Tests' }
nnoremap <silent> <Leader>tn :TestNearest<CR>
let g:lmap.t.n = [':TestNearest', 'Test nearest']
" Test current file 
nnoremap <silent> <Leader>tf :TestFile<CR>
let g:lmap.t.f = [':TestFile', 'Test File']
" Test last 
nnoremap <silent> <Leader>tl :TestLast<CR>
let g:lmap.t.l = [':TestLast', 'Relaunch last test']

" launch terminal
nnoremap <silent> <Leader>' :terminal<CR>i
let g:lmap[''''] = [':terminal', 'Open terminal']

""" Fugitive setup
let g:lmap.g = { 'name' : 'Git' }

nnoremap <Leader>gg :Git<CR>
let g:lmap.g.g = [':Git', 'Git Status']

nnoremap <Leader>gp :Git push<CR>
let g:lmap.g.p = [':Git push', 'Git push']

nnoremap <Leader>gf :Git fetch<CR>
let g:lmap.g.f = [':Git fetch', 'Git fetch']

nnoremap <Leader>gP :Git pull<CR>
let g:lmap.g.P = [':Git pull', 'Git pull']

nnoremap <Leader>gc :Telescope git_branches<CR>
let g:lmap.g.c = [':Telescope git_branches', 'Git checkout']

nnoremap <Leader>gl :Telescope git_commits<CR>
let g:lmap.g.l = [':Telescope git_commits', 'Git log']

nnoremap <Leader>gb :Telescope git_bcommits<CR>
let g:lmap.g.b = [':Telescope git_bcommits', 'Git log current buffer']

nnoremap <Leader>gB :BlamerToggle<CR>
let g:lmap.g.B = [':BlamerToggle', 'See line by line authors']

nnoremap <Leader>gr :Octo pr list<CR>
let g:lmap.g.r = [':Octo pr list', 'Github pull request']

nnoremap <Leader>gR :Octo pr reviews<CR>
let g:lmap.g.R = [':Octo pr reviews', 'Github list reviews']

nnoremap <Leader>gi :Octo issue list<CR>
let g:lmap.g.i = [':Octo issue list<CR>', 'Github issues']

"""" coc.nvim 
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

let g:lmap.c = { 'name' : 'Code' }
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
nmap <leader>cr <Plug>(coc-rename)
let g:lmap.c.r = ['<Plug>(coc-rename)', 'Rename']
" Make sure `"codeLens.enable": true` is set in your coc config
nmap <leader>cl :call CocActionAsync('codeLensAction')<CR>
let g:lmap.c.l = [':call CocActionAsync(''codeLensAction'')<CR>', 'CodeLensAction']

nmap <leader>cs :Telescope treesitter<CR>
let g:lmap.c.s = [':Telescope treesitter', 'Symbols']

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent><leader>ch :call <SID>show_documentation()<CR>
let g:lmap.c.h = [':call <SID>show_documentation()<CR>', 'Display Help ']

let g:lmap.c.p = { 'name' : 'Peek' }
nnoremap <silent><nowait> <Leader>cpf :call CocActionAsync('jumpDefinition', v:false)<CR>
let g:lmap.c.p.f = [':call CocActionAsync(jumpDefinition, v:false)', 'Peek Definition']
nnoremap <silent><nowait> <Leader>cpc :call CocActionAsync('jumpDeclaration', v:false)<CR>
let g:lmap.c.p.c = [':call CocActionAsync(jumpDeclaration, v:false)', 'Peek Declaration']
nnoremap <silent><nowait> <Leader>cpi :call CocActionAsync('jumpImplementation', v:false)<CR>
let g:lmap.c.p.i = [':call CocActionAsync(jumpImplementation, v:false)', 'Peek Implementations']
nnoremap <silent><nowait> <Leader>cpt :call CocActionAsync('jumpTypeDefinition', v:false)<CR>
let g:lmap.c.p.t = [':call CocActionAsync(jumpTypeDefinition, v:false)', 'Peek Type Definition']
nnoremap <silent><nowait> <Leader>cpr :call CocActionAsync('jumpReferences', v:false)<CR>
let g:lmap.c.p.r = [':call CocActionAsync(jumpReferences, v:false)', 'Peek References']

let g:lmap.c.g = { 'name' : 'Go to' }
nnoremap <silent><nowait> <Leader>cgf :call CocActionAsync('jumpDefinition')<CR>
let g:lmap.c.g.f = [':call CocActionAsync(jumpDefinition)', 'Go to Definition']
nnoremap <silent><nowait> <Leader>cgc :call CocActionAsync('jumpDeclaration')<CR>
let g:lmap.c.g.c = [':call CocActionAsync(jumpDeclaration)', 'Go to Declaration']
nnoremap <silent><nowait> <Leader>cgi :call CocActionAsync('jumpImplementation')<CR>
let g:lmap.c.g.i = [':call CocActionAsync(jumpImplementation)', 'Go to Implementations']
nnoremap <silent><nowait> <Leader>cgt :call CocActionAsync('jumpTypeDefinition')<CR>
let g:lmap.c.g.t = [':call CocActionAsync(jumpTypeDefinition)', 'Go to Type Definition']
nnoremap <silent><nowait> <Leader>cgr :call CocActionAsync('jumpReferences')<CR>
let g:lmap.c.g.r = [':call CocActionAsync(jumpReferences)', 'Go to References']



nnoremap <silent><nowait> <Leader>cc :Dispatch<CR>
let g:lmap.c.c = ['Compile', 'Compile']
" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocActionAsync('runCommand', 'editor.action.organizeImport')
nnoremap <silent> <Leader>ci :OR<CR>
let g:lmap.c.i = [':OR', 'Organize imports']

let g:lmap.d = { 'name' : 'Debug' }

nnoremap <leader>dd :call vimspector#Launch()<CR>
let g:lmap.d.c = [ 'VimspectorContinue', 'Continue']
nmap <Leader>dc <Plug>VimspectorContinue
let g:lmap.d.c = [ 'VimspectorContinue', 'Continue']
nmap <Leader>ds <Plug>VimspectorStop
let g:lmap.d.s = [ 'VimspectorStop', 'Stop']
nmap <Leader>dq :VimspectorReset<CR>
let g:lmap.d.r = [ 'VimspectorReset', 'Quit']
nmap <Leader>dr <Plug>VimspectorRestart
let g:lmap.d.r = [ 'VimspectorRestart', 'Restart']
nmap <Leader>dp <Plug>VimspectorPause
let g:lmap.d.p = [ 'VimspectorPause', 'Pause']
nmap <Leader>db <Plug>VimspectorToggleBreakpoint
let g:lmap.d.b = [ 'VimspectorToggleBreakpoint', 'Toggle Breakpoint']
nmap <Leader>dC <Plug>VimspectorToggleConditionalBreakpoint
let g:lmap.d.C = [ 'VimspectorToggleConditionalBreakpoint', 'Toggle Conditional Breakpoint']
nmap <Leader>df <Plug>VimspectorAddFunctionBreakpoint
let g:lmap.d.f = [ 'VimspectorAddFunctionBreakpoint', 'Add Function Breakpoint']
nmap <Leader>do <Plug>VimspectorStepOver
let g:lmap.d.o = [ 'VimspectorStepOver', 'Step Over']
nmap <Leader>di <Plug>VimspectorStepInto
let g:lmap.d.i = [ 'VimspectorStepInto', 'Step Into']
nmap <Leader>dO <Plug>VimspectorStepOut
let g:lmap.d.O = [ 'VimspectorStepOut', 'Step Out']
nmap <Leader>dR <Plug>VimspectorRunToCursor
let g:lmap.d.R = [ 'VimspectorRunToCursor', 'Run To Cursor']
nmap <Leader>dS :VimspectorReset<CR>
let g:lmap.d.S = [ 'VimspectorReset', 'Reset']

let g:lmap.e = { 'name' : 'Edit' }
nnoremap <Leader>eu :ToggleUndoTree<CR>
let g:lmap.e.u = [ 'ToggleUndoTree', 'Undo Tree']


let g:lmap.q = { 'name' : 'Quickfix' }
nnoremap <silent><C-g> :call CloseQuickFixOrPreview()<CR>
nnoremap <silent><leader>qc  :cclose\|:lclose<CR>
let g:lmap.q.c = [ 'close_quick_fix_or_preview', 'Close']
nnoremap <silent><leader>qn  :cnext\|:lnext<CR>
let g:lmap.q.n = [ 'clnext', 'Next']
nnoremap <silent><leader>qp  :cprev \|:lprev<CR>
let g:lmap.q.p = [ 'clprevious', 'Previous']
nnoremap <silent><leader>qf  :cfirst\|:lfirst<CR>
let g:lmap.q.f = [ 'clfirst', 'First']
nnoremap <silent><leader>ql  :clast\|:last<CR>
let g:lmap.q.l = [ 'cllast', 'Last']


" Remap keys for applying codeAction to the current buffer.
nmap <leader>ca  <Plug>(coc-codeaction)
let g:lmap.c.a = ['coc-codeaction', 'Code Action']
" Apply AutoFix to problem on the current line.
nmap <leader>cf  <Plug>(coc-fix-current)
let g:lmap.c.f = ['<Plug>(coc-fix-current)', 'Fix Current']
" Disabling Persistent Undo for Temporary Files
augroup vimrc
autocmd!
autocmd BufWritePre /tmp/* setlocal noundofile
augroup END

" Automatically reload the vim configuration when it's updated
augroup vimconfig
autocmd!
autocmd BufWritePost ~/.config/nvim/* :source $MYVIMRC
autocmd BufWritePost ~/.config/nvim/* echo "Reloaded vim configuration"
augroup END

function! s:bookmark_current_dir() 
if fugitive#head() != ''
  let dir_path = fnamemodify(fugitive#repo().dir(), ':h') 
  execute 'cd' dir_path
  if stridx(dir_path, ".nvim/plugged") == -1 
	  execute 'silent CtrlPBookmarkDirAdd!' dir_path
  endif
endif
endfunction

" Changes directory to the root of the repo when a file is open and registers the repository in the CtrlPBookmarkDir
augroup project_discovery
  autocmd!
  " automatically change directory when entering a new project.
  autocmd User Fugitive :call <SID>bookmark_current_dir()
  " automatically change directory to the project root when entering a new
  " buffer.
  autocmd BufEnter * :call <SID>bookmark_current_dir()
augroup END

" Programing languages autocmd
" TODO move to ftplugins
" rust autoformat on save
augroup rust
autocmd!
autocmd FileType rust let b:dispatch = 'cargo c'
autocmd BufWritePre *.rs :silent call CocAction('runCommand', 'editor.action.organizeImport') | call CocAction('format')
autocmd BufEnter *.rs nnoremap <buffer><silent><Leader>cla :RustEmitAsm<CR>
autocmd BufEnter *.rs nnoremap <buffer><silent><Leader>cli :RustEmitIr<CR>
autocmd BufEnter *.rs nnoremap <buffer><silent><Leader>cle :RustExpand<CR>
autocmd BufEnter *.rs nnoremap <buffer><silent><Leader>cd :call CocAction('runCommand', 'rust-analyzer.openDocs')<CR>
autocmd BufEnter *.rs nnoremap <buffer><silent><Leader>le :call CocAction('runCommand', 'rust-analyzer.explainError')<CR>
augroup END

augroup golang
autocmd!
autocmd FileType go let b:dispatch = 'go build ./...'
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport') | call CocAction('format')
autocmd BufEnter *.go nnoremap <buffer><silent><Leader>cgi :call CocActionAsync('runCommand' ,'go.impl.cursor')<CR>
autocmd BufEnter *.go nnoremap <buffer><silent><Leader>tt :call CocActionAsync('runCommand' ,'go.test.toggle')<CR>
autocmd BufEnter *.go nnoremap <buffer><silent><Leader>tge :call CocActionAsync('runCommand' ,'go.test.generate.exported') <CR>
autocmd BufEnter *.go nnoremap <buffer><silent><Leader>tgf :call CocActionAsync('runCommand' ,'go.test.generate.function') <CR>
autocmd BufEnter *.go nnoremap <buffer><silent><Leader>tgF :call CocActionAsync('runCommand' ,'go.test.generate.file') <CR>
augroup END

augroup scala 
autocmd! 
autocmd FileType scala let b:dispatch = 'sbt compile'
" autocmd BufWritePre *.scala :silent call CocAction('runCommand', 'editor.action.organizeImport') | call CocAction('format')
augroup END

augroup Makefile
autocmd!
autocmd BufEnter Makefile set expandtab=0
augroup END

set guifont=Fira\ Code,Retina:h16
