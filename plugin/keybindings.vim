let g:lmap =  {}
" set leader to space
let mapleader=" "
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
nnoremap <silent> <Leader>vf :lua require("my_telescope").git_files_nvim()<CR>
let g:lmap.v.f = [':lua require("my_telescope").git_files_nvim()<CR>', 'Find file']

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

nnoremap <silent> <Leader>wt :tabnext<CR>
let g:lmap.w.t = [':tabNext<CR>', 'Next Tab']

nnoremap <silent> <Leader>wT :tabnew<CR>
let g:lmap.w.T = [':tabnew<CR>', 'New Tab']

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

tnoremap <silent> <Leader>wj <C-\><C-n><C-w>j
tnoremap <silent> <Leader>wk <C-\><C-n><C-w>k
tnoremap <silent> <Leader>wl <C-\><C-n><C-w>l
tnoremap <silent> <Leader>wh <C-\><C-n><C-w>h
tnoremap <silent> <Leader>wc <C-\><C-n><C-w>c
tnoremap <silent> <Leader>ws <C-\><C-n>:split<CR>
tnoremap <silent> <Leader>wv <C-\><C-n>:vsplit<CR>

" Project
let g:lmap.p = { 'name' : 'Project' }
nnoremap <silent> <Leader>pf :lua require("my_telescope").git_files()<CR>
let g:lmap.p.f = [':lua require("my_telescope").git_files()<CR>', 'Find file']
nnoremap <silent> <Leader>pp :call tlbd#move_to_directory()<CR>
let g:lmap.p.p = [':CtrlPBookmarkDir', 'Open project']
nnoremap <silent> <Leader>pd :RnvimrToggle<CR>
let g:lmap.p.d = [':RnvimrToggle<CR>', 'Project drawer']
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

nnoremap <silent> <Leader>' :botright Ttoggle<CR>
let g:lmap[''''] = [':terminal', 'Open terminal']

""" Fugitive setup
let g:lmap.g = { 'name' : 'Git' }

nnoremap <Leader>gg :Git<CR>
let g:lmap.g.g = [':Git', 'Git Status']

nnoremap <Leader>gd :Gdiffsplit<CR>
let g:lmap.g.g = [':Gdiffsplit', 'Git Diff']

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

nnoremap <Leader>gs :Telescope git_status<CR>
let g:lmap.g.s = [':Telescope git_status', 'Git log current buffer']

nnoremap <Leader>gB :BlamerToggle<CR>
let g:lmap.g.B = [':BlamerToggle', 'See line by line authors']
"
"""" coc.nvim 
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)
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

nmap <leader>cS :CocList services<CR>
let g:lmap.c.s = [':CocList services', 'Services']


" Use K to either doHover or show documentation in preview window
nnoremap <silent> K :<CR>
nnoremap <silent><leader>ch :ShowDoc<CR>
let g:lmap.c.h = [':ShowDoc', 'Display Help ']

let g:lmap.c.p = { 'name' : 'Peek' }
nnoremap <silent><nowait> <Leader>cpf :call CocActionAsync('jumpDefinition', v:false)<CR>
let g:lmap.c.p.f = [':call CocActionAsync("jumpDefinition", v:false)', 'Peek Definition']
nnoremap <silent><nowait> <Leader>cpc :call CocActionAsync('jumpDeclaration', v:false)<CR>
let g:lmap.c.p.c = [':call CocActionAsync("jumpDeclaration", v:false)', 'Peek Declaration']
nnoremap <silent><nowait> <Leader>cpi :call CocActionAsync('jumpImplementation', v:false)<CR>
let g:lmap.c.p.i = [':call CocActionAsync("jumpImplementation", v:false)', 'Peek Implementations']
nnoremap <silent><nowait> <Leader>cpt :call CocActionAsync('jumpTypeDefinition', v:false)<CR>
let g:lmap.c.p.t = [':call CocActionAsync("jumpTypeDefinition", v:false)', 'Peek Type Definition']
nnoremap <silent><nowait> <Leader>cpr :call CocActionAsync('jumpReferences', v:false)<CR>
let g:lmap.c.p.r = [':call CocActionAsync("jumpReferences", v:false)', 'Peek References']

let g:lmap.c.g = { 'name' : 'Go to' }
nnoremap <silent><nowait> <Leader>cgf :call CocActionAsync('jumpDefinition')<CR>
let g:lmap.c.g.f = [':call CocActionAsync("jumpDefinition")', 'Go to Definition']
nnoremap <silent><nowait> <Leader>cgc :call CocActionAsync('jumpDeclaration')<CR>
let g:lmap.c.g.c = [':call CocActionAsync("jumpDeclaration")', 'Go to Declaration']
nnoremap <silent><nowait> <Leader>cgi :call CocActionAsync('jumpImplementation')<CR>
let g:lmap.c.g.i = [':call CocActionAsync("jumpImplementation")', 'Go to Implementations']
nnoremap <silent><nowait> <Leader>cgt :call CocActionAsync('jumpTypeDefinition')<CR>
let g:lmap.c.g.t = [':call CocActionAsync("jumpTypeDefinition")', 'Go to Type Definition']
nnoremap <silent><nowait> <Leader>cgr :call CocActionAsync('jumpReferences')<CR>
let g:lmap.c.g.r = [':call CocActionAsync("jumpReferences")', 'Go to References']



nnoremap <silent><nowait> <Leader>cc :Dispatch<CR>
let g:lmap.c.c = [':Dispatch', 'Compile']

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

nnoremap <Leader>em :lua require("telescope.builtin").marks()<CR>
let g:lmap.e.m = [ ':lua require("telescope.builtin").marks()<CR>', 'List marks']

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
let g:lmap.c.a = ['<Plug>(coc-codeaction)', 'Code Action']
" Apply AutoFix to problem on the current line.
nmap <leader>cf  <Plug>(coc-fix-current)
let g:lmap.c.f = ['<Plug>(coc-fix-current)', 'Fix Current']
