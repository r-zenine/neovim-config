function! tlbd#bookmark(dir_path)
   silent echo luaeval('require("bookmarks").add_bookmark(_A)', a:dir_path)
endfunction

function! tlbd#move_to_directory()
    lua require("bookmarks").move_to_directory()
endfunction

function! s:bookmark_current_dir() 
if fugitive#head() != ''
  let dir_path = fnamemodify(fugitive#repo().dir(), ':h') 
  execute 'cd' dir_path
  if stridx(dir_path, ".nvim/plugged") == -1 
    call tlbd#bookmark(dir_path)
  endif
endif
endfunction

" Changes directory to the root of the repo when a file is open and registers the repository
augroup project_discovery
  autocmd!
  " automatically change directory when entering a new project.
  autocmd User Fugitive :call <SID>bookmark_current_dir()
  " automatically change directory to the project root when entering a new
  " buffer.
  autocmd BufEnter * :call <SID>bookmark_current_dir()
  autocmd BufWinEnter * :call <SID>bookmark_current_dir()
augroup END



function! s:go_to_root() 
if fugitive#head() != ''
  let dir_path = fnamemodify(fugitive#repo().dir(), ':h') 
  execute 'cd' dir_path
endif
endfunction

