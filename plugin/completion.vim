" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <silent><expr> <CR> compe#confirm('<CR>')

inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Avoid showing message extra message when using completion
set shortmess+=c

