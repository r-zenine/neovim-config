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

let g:neoterm_term_per_tab = 1
let g:neoterm_autoinsert = 1
let g:neoterm_default_mod= ':botright'
let g:neoterm_size= 10
let g:neoterm_autoscroll= 1

