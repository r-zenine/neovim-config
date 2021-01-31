let g:lexical#spelllang = ['en_us','fr', 'en_gb']
let g:lexical#thesaurus = ['~/.config/nvim/thesaurus/words.txt',]
let g:lexical#spell_key = '<leader>es'
let g:lexical#thesaurus_key = '<leader>et'
set wildignore+=*/thesaurus/*,*/.neuron/*                           " For Node

augroup pencil
  autocmd!
  autocmd FileType markdown,mkd call pencil#init({'wrap': 'hard', 'autoformat': 0}) 
  autocmd FileType markdown,mkd DittoOn
  autocmd FileType markdown,mkd call lexical#init()
augroup END
