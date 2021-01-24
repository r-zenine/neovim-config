setlocal wildignore+=*/.bloop/*,*/.metals/*,*/target/*,*class    " For Scala

augroup scala 
autocmd! 
autocmd FileType scala let b:dispatch = 'sbt compile'
" autocmd BufWritePre *.scala :silent call CocAction('runCommand', 'editor.action.organizeImport') | call CocAction('format')
augroup END


