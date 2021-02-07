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
        if path:find("nvim/plugged") == nil then
            table.insert(bookmarks, path)
            fs_utils.write_lines(db_path, bookmarks)
        end
    end
end

local function get_bookmarks()
    if #bookmarks == 0 then
        bookmarks = fs_utils.lines_from(db_path)
    end
    return bookmarks
end

local function action_change_directory()
    local actions = require("telescope.actions")
    local entry = actions.get_selected_entry()
    vim.cmd(string.format(":cd %s", entry.value))
    vim.cmd(string.format(":tcd %s", entry.value))
    vim.cmd(":q!")
    require('telescope.builtin').git_files({
        shorten_path=true,
        cwd = entry.value
    })
end

local function move_to_directory()
    local pickers = require("telescope.pickers")
    local sorters = require("telescope.sorters")
    local finders = require("telescope.finders")
    local themes = require("telescope.themes")
    pickers.new(themes.get_dropdown(), {
        prompt_title = 'Diretory bookmarks',
        finder = finders.new_table(get_bookmarks()),
        sorter = sorters.get_fzy_sorter(),
        attach_mappings = function(_, map)
          map('i', '<CR>', action_change_directory)
          return true
        end,
      }):find()
end

return {
    add_bookmark = add_bookmark,
    get_bookmarks = get_bookmarks,
    move_to_directory = move_to_directory,
}


