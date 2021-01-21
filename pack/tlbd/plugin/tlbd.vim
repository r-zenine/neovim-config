function! tlbd#bookmark(dir_path)
   silent echo luaeval('require("bookmarks").add_bookmark(_A)', a:dir_path)
endfunction

function! tlbd#move_to_directory()
    lua require("bookmarks").move_to_directory()
endfunction

nmap <Plug>TLBD_CHANGE_DIRECTORY call tlbd#move_to_directory()
