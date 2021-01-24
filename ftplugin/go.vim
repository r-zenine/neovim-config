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


