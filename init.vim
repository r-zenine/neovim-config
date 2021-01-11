"*t****************************************************************************
"" Vim-PLug core
"*****************************************************************************
call plug#begin('~/.config/nvim/plugged')
" Theme for neovim.
Plug 'dracula/vim'
" fuzzy file finder / file navigation inside a project
Plug 'ctrlpvim/ctrlp.vim'
Plug 'spolu/dwm.vim'
" Session 
Plug 'tpope/vim-obsession'
" editing helpers
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-abolish'
" run background jobs
Plug 'tpope/vim-dispatch'
Plug 'radenling/vim-dispatch-neovim'
" git wrapper
Plug 'tpope/vim-fugitive'
" Programing languages
Plug 'rust-lang/rust.vim' " RUST
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " GOLANG
Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'} " PYTHON
" Tests
Plug 'janko-m/vim-test'
" Linters
Plug 'w0rp/ale'
" Greping
Plug 'mhinz/vim-grepper'
" LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" DAP
Plug 'puremourning/vimspector'
" visual-leader
Plug 'hecal3/vim-leader-guide'
call plug#end()

" Define prefix dictionary
let g:lmap =  {}

" set leader to space
let mapleader=" "
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*/target/*,*/plugged/*    " MacOSX/Linux
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|cargo|sbt)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }
" tests
" make the test result populate the quicklist
let test#strategy = "dispatch"

" Configure current grep
let g:grepper = {}
let g:grepper.tools = ['rg', 'git', 'grep', 'ag']

" this is handled by LanguageClient [LC]
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0
let g:go_code_completion_icase = 0
let g:go_fmt_command = "goimports"
let g:go_auto_type_info = 1


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

"" persistent undo 
set undofile
if !has('nvim')
	set undodir=~/.cache/nvim/undo
endif
" Font
set guifont="Cascadia Code:h15"
"" Setup an abrev to run grepper instead of grep
function! SetupCommandAlias(input, output)
exec 'cabbrev <expr> '.a:input
\ .' ((getcmdtype() is# ":" && getcmdline() is# "'.a:input.'")'
\ .'? ("'.a:output.'") : ("'.a:input.'"))'
endfunction
call SetupCommandAlias("grep", "GrepperGrep")
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
let g:lmap.g = { 'name' : 'Git' }
nnoremap <Leader>ve :e $MYVIMRC<CR>
let g:lmap.v.e = ['e $MYVIMRC', 'Open vimrc']
" Reload vimr configuration file
nnoremap <Leader>vr :source $MYVIMRC<CR>
let g:lmap.v.r = ['source $MYVIMRC', 'Reload vim config']
" Install plugins
nnoremap <Leader>vp :PlugInstall<CR>
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
nnoremap <silent> <Leader>bl :CtrlPBuffer<CR>
let g:lmap.b.l = [':CtrlPBuffer', 'List buffers']
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

nnoremap <Leader>wn :call DWM_New()<CR>
let g:lmap.w.n = ['DWM_New', 'New window']
nnoremap <Leader>wf :call DWM_Focus()<CR>
let g:lmap.w.f = ['DWM_New', 'Focus']
nnoremap <Leader>wr :call DWM_Rotate(1)<CR>
let g:lmap.w.r = ['DWM_New', 'Rotate Window']


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
nnoremap <silent> <Leader>pf :CtrlP<CR>
let g:lmap.p.f = [':CtrlP', 'Find file']
nnoremap <silent> <Leader>pp :CtrlPBookmarkDir<CR>
let g:lmap.p.p = [':CtrlPBookmarkDir', 'Open project']
nnoremap <silent> <Leader>pI :CtrlPClearCache<CR>
let g:lmap.p.I = [':CtrlPClearCache', 'Clear cache']
" Project/Sessions
let g:lmap.p.s = { 'name' : 'Session' }
nnoremap <Leader>psr :Obsession!<CR>
let g:lmap.p.s.r = ['Obsession!', 'Toggle session auto save']
nnoremap <Leader>psl :source Session.vim<CR>
let g:lmap.p.s.l = [':source Session.vim', 'load session']
nnoremap <Leader>pss :mksession!<CR>
let g:lmap.p.s.s = ['mksession!', 'Save session']

" Configure the linter
nmap <silent> [W <Plug>(ale_first)
nmap <silent> [w <Plug>(ale_previous)
nmap <silent> ]w <Plug>(ale_next)
nmap <silent> ]W <Plug>(ale_last)

let g:lmap.l = { 'name' : 'Linter' }
nnoremap <Leader>lf <Plug>(ale_first)
let g:lmap.l.f = ['<Plug>(ale_first)', 'First linter error']
nnoremap <Leader>ll <Plug>(ale_last)
let g:lmap.l.l = ['<Plug>(ale_last)', 'Last linter error']
nnoremap <Leader>ln <Plug>(ale_next)
let g:lmap.l.n = ['<Plug>(ale_first)', 'Next linter error']
nnoremap <Leader>lp <Plug>(ale_previous)
let g:lmap.l.p = ['<Plug>(ale_first)', 'Previous linter error']
nnoremap <silent><nowait> <Leader>ld :CocList diagnostics<CR>
let g:lmap.l.d = ['CocList diagnostics', 'Diagnostics list']

" Search for the current word
let g:lmap.s = { 'name' : 'Search' }
nnoremap <Leader>sw :Grepper -cword -noprompt<CR>
let g:lmap.s.w = [':Grepper -cword -noprompt', 'Search word']
nnoremap <Leader>ss <plug>(GrepperOperator)<CR>
let g:lmap.s.s = ['<Plug>(GrepperOperator)', 'Search selection']
" Search for the current word
nnoremap <Leader>* :Grepper -cword -noprompt<CR>
let g:lmap['*'] = ['<Plug>(GrepperOperator)', 'Search word']
" Search for the current selection
nmap gs <plug>(GrepperOperator)
xmap gs <plug>(GrepperOperator)

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
nnoremap <silent> <Leader>' :terminal<CR>
let g:lmap[''''] = [':terminal', 'Open terminal']

""" Fugitive setup
let g:lmap.g = { 'name' : 'Git' }
nnoremap <Leader>gg :Git<CR>
let g:lmap.g.g = [':Git', 'Git Status']


"""" coc.nvim 
" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


let g:lmap.c = { 'name' : 'Code' }
let g:lmap.c.l = { 'name' : 'Language Specific' }
" Remap for rename current word
nnoremap <leader>cr <Plug>(coc-rename)
let g:lmap.c.r = ['<Plug>(coc-rename)', 'Rename']

" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
nnoremap <silent><leader>ch :call <SID>show_documentation()<CR>
let g:lmap.c.h = ['show_documentation', 'Display Help ']

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
nnoremap <Leader>dc <Plug>VimspectorContinue
let g:lmap.d.c = [ 'VimspectorContinue', 'Continue']
nnoremap <nowait><Leader>ds <Plug>VimspectorStop
let g:lmap.d.s = [ 'VimspectorStop', 'Stop']
nnoremap <Leader>dr <Plug>VimspectorRestart
let g:lmap.d.r = [ 'VimspectorRestart', 'Restart']
nnoremap <Leader>dp <Plug>VimspectorPause
let g:lmap.d.p = [ 'VimspectorPause', 'Pause']
nnoremap <Leader>db <Plug>VimspectorToggleBreakpoint
let g:lmap.d.b = [ 'VimspectorToggleBreakpoint', 'Toggle Breakpoint']
nnoremap <Leader>dC <Plug>VimspectorToggleConditionalBreakpoint
let g:lmap.d.C = [ 'VimspectorToggleConditionalBreakpoint', 'Toggle Conditional Breakpoint']
nnoremap <Leader>df <Plug>VimspectorAddFunctionBreakpoint
let g:lmap.d.f = [ 'VimspectorAddFunctionBreakpoint', 'Add Function Breakpoint']
nnoremap <Leader>do <Plug>VimspectorStepOver
let g:lmap.d.o = [ 'VimspectorStepOver', 'Step Over']
nnoremap <Leader>di <Plug>VimspectorStepInto
let g:lmap.d.i = [ 'VimspectorStepInto', 'Step Into']
nnoremap <Leader>dO <Plug>VimspectorStepOut
let g:lmap.d.O = [ 'VimspectorStepOut', 'Step Out']
nnoremap <Leader>dR <Plug>VimspectorRunToCursor
let g:lmap.d.R = [ 'VimspectorRunToCursor', 'Run To Cursor']
nnoremap <Leader>dS :VimspectorReset<CR>
let g:lmap.d.S = [ 'VimspectorReset', 'Reset']


let g:lmap.q = { 'name' : 'Quickfix' }

function! s:close_quick_fix_or_preview() 
	exec windo if &buftype == "quickfix" || &buftype == "locationlist" | lclose | cclose | endif
endfunction

function! s:clnext() 
	if &buftype == "quickfix" 
		exec cnext
	endif
	if &buftype == "locationlist" 
		exec lnext
	endif
endfunction
function! s:clprevious() 
	if &buftype == "quickfix" 
		exec cprevious
	endif
	if &buftype == "locationlist" 
		exec lprevious
	endif
endfunction

function! s:clfirst() 
	if &buftype == "quickfix" 
		exec cfirst
	endif
	if &buftype == "locationlist" 
		exec lfirst
	endif
endfunction
function! s:cllast() 
	if &buftype == "quickfix" 
		exec clast
	endif
	if &buftype == "locationlist" 
		exec llast
	endif
endfunction

nnoremap <silent><C-g> <SID>close_quick_fix_or_preview<CR>
nnoremap <silent><leader>qc  <SID>close_quick_fix_or_preview<CR>
let g:lmap.q.c = [ 'close_quick_fix_or_preview', 'Close']
nnoremap <silent><leader>qn  <SID>clnext<CR>
let g:lmap.q.n = [ 'clnext', 'Next']
nnoremap <silent><leader>qp  <SID>clprevious<CR>
let g:lmap.q.p = [ 'clprevious', 'Previous']
nnoremap <silent><leader>qf  <SID>clfirst<CR>
let g:lmap.q.f = [ 'clfirst', 'First']
nnoremap <silent><leader>ql  <SID>cllast<CR>
let g:lmap.q.l = [ 'cllast', 'Last']


" Remap keys for applying codeAction to the current buffer.
nnoremap <leader>ca  <Plug>(coc-codeaction)
let g:lmap.c.a = ['coc-codeaction', 'Code Action']
" Apply AutoFix to problem on the current line.
nnoremap <leader>cf  <Plug>(coc-fix-current)
let g:lmap.c.f = ['fix-current', 'Fix Current']
" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
" xmap <leader>a  <Plug>(coc-codeaction-selected)
" nmap <leader>a  <Plug>(coc-codeaction-selected)
" Symbols window

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
" Changes directory to the root of the repo when a file is open and registers the repository in the CtrlPBookmarkDir
augroup project_discovery
  autocmd!
  " automatically change directory when entering a new project.
  autocmd User Fugitive let dir_path = fnamemodify(fugitive#repo().dir(), ':h') | :execute 'cd' dir_path|:if stridx(dir_path, ".nvim/plugged") >= 0 | :execute 'silent CtrlPBookmarkDirAdd!' dir_path
  " automatically change directory to the project root when entering a new
  " buffer.
  autocmd BufEnter * if fugitive#head() != '' | let dir_path = fnamemodify(fugitive#repo().dir(), ':h') | :execute 'cd' dir_path|:if stridx(dir_path, ".nvim/plugged") >= 0 | :execute 'silent CtrlPBookmarkDirAdd!' dir_path | endif
augroup END

" Programing languages autocmd
" rust autoformat on save
augroup rust
autocmd!
autocmd BufWritePost Filetype rust RustFmt 
autocmd FileType rust let b:dispatch = 'cargo c'
autocmd FileType rust let b:termdebugger = 'rust-gdb'
autocmd BufEnter *.rs nnoremap <buffer><silent><Leader>cla :RustEmitAsm<CR>
autocmd BufEnter *.rs nnoremap <buffer><silent><Leader>cli :RustEmitIr<CR>
autocmd BufEnter *.rs nnoremap <buffer><silent><Leader>cle :RustExpand<CR>
augroup END

augroup golang
autocmd!
autocmd FileType go let b:dispatch = 'go build ./...'
autocmd BufEnter FileType go nnoremap <buffer><silent><Leader>clk :GoKeify<CR>
autocmd BufEnter FileType go nnoremap <buffer><silent><Leader>clf :GoFillStruct<CR>
autocmd BufEnter FileType go nnoremap <buffer><silent><Leader>cle :GoIfErr<CR>
autocmd BufEnter FileType go nnoremap <buffer><silent><Leader>cli :GoImpl
autocmd BufEnter FileType go nnoremap <buffer><silent><Leader>clw :GoWhicherrs<CR>
autocmd BufEnter FileType go nnoremap <buffer><silent><Leader>clc :GoChannelPeers<CR>
autocmd BufEnter FileType go nnoremap <buffer><silent><Leader>clI :GoImplements<CR>
augroup END

augroup coc
autocmd!
autocmd BufReadPre,FileReadPre * :CocRestart
augroup END
