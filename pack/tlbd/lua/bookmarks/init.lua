local fs_utils = require("bookmarks.fs_utils")
local db_path = vim.fn.expand("~/.local/share/nvim/bookmarks.db")
local bookmarks = fs_utils.lines_from(db_path)

local function add_bookmark(path)
    for _, line in ipairs(bookmarks) do
        if line == path then
            return
        end
    end
    if bookmarks[path] == nil then
        table.insert(bookmarks, path)
        fs_utils.write_lines(db_path, bookmarks)
    end
end

local function get_bookmarks()
    if table.getn(bookmarks) == 0 then
        bookmarks = fs_utils.lines_from(db_path)
    end
    return bookmarks
end

local function move_to_directory()
    local pickers = require("telescope.pickers")
    local finders = require("telescope.finders")
    local actions = require("telescope.actions")
    pickers.new({}, {
        prompt_title = 'Diretory bookmarks',
        finder = finders.new_table(get_bookmarks()),
        attach_mappings = function(_, map)
          -- Map "<CR>" in insert mode to the funciton, actions.set_command_line
          map('i', '<CR>', actions.set_command_line)

          return true
        end,
      }):find()
end

return {
    add_bookmark = add_bookmark,
    get_bookmarks = get_bookmarks,
    move_to_directory = move_to_directory,
}


