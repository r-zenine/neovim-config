setlocal wildignore+=*/.bloop/*,*/.metals/*,*/target/*,*class    " For Scala
" taken from here https://gist.github.com/nkpart/5945278
setlocal efm=%E\ %#[error]\ %f:%l:\ %m,%C\ %#[error]\ %p^,%-C%.%#,%Z,
   \%W\ %#[warn]\ %f:%l:\ %m,%C\ %#[warn]\ %p^,%-C%.%#,%Z,
   \%-G%.%#

augroup scala 
autocmd! 
autocmd FileType scala let b:dispatch = 'sbt -Dsbt.log.noformat=true compile'
augroup END


