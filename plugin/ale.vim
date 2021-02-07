let g:ale_completion_enabled = 0
let g:ale_completion_autoimport = 0
let g:ale_disable_lsp = 1
" Write this in your vimrc file
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
" You can disable this option too
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
" Write this in your vimrc file
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
let g:ale_linters = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'markdown': ['proselint'],
            \   'python': ['prospector'],
            \   'go': ['golangci-lint'],
            \   'text': ['proselint'],
            \   }
