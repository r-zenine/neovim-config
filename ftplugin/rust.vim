setlocal wildignore+=*/.cargo/*,*/target/*                       " For Rust
"
" Disabling Persistent Undo for Temporary Files
" Programing languages autocmd
" TODO move to ftplugins
" rust autoformat on save
augroup rust
autocmd!
autocmd FileType rust let b:dispatch = 'cargo c'
" autocmd BufWritePre *.rs :silent call CocAction('runCommand', 'editor.action.organizeImport') | call CocAction('format')
autocmd BufEnter *.rs nnoremap <buffer><silent><Leader>cd :call CocAction('runCommand', 'rust-analyzer.openDocs')<CR>
autocmd BufEnter *.rs nnoremap <buffer><silent><Leader>le :call CocAction('runCommand', 'rust-analyzer.explainError')<CR>
augroup END

" listing all available tests
" cargo test --tests -- --list 2>/dev/null|grep '::'|sed 's/: test//'
