"" persistent undo 
set undodir=~/.cache/nvim/undo
set noswapfile
set nobackup
set nowritebackup
set undofile

augroup vimrc
autocmd!
autocmd BufWritePre /tmp/* setlocal noundofile
augroup END


