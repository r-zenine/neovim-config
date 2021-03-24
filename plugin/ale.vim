let g:ale_completion_enabled = 0
let g:ale_completion_autoimport = 0
let g:ale_disable_lsp = 1
" Write this in your vimrc file
let g:ale_set_loclist = 1
let g:ale_set_quickfix = 0
let g:ale_open_list = 1
let g:ale_linters = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'markdown': ['proselint'],
            \   'python': ['prospector'],
            \   'go': ['golangci-lint'],
            \   'scala': ['scalastyle'],
            \   'text': ['proselint'],
            \   'c': ['clang'],
            \   'c++': ['clang'],
            \   }

let g:ale_fixers = {
  \   '*': ['remove_trailing_lines', 'trim_whitespace'],
  \   'markdown': ['textlint'],
  \   }

let g:ale_cpp_clang_options = '-Wall -Wextra -std=c++17'
let g:ale_cpp_cc_options = '-std=c++17 -Wall -Wextra'
