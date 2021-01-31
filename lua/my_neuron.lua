-- these are all the default values
local sorters = require('telescope.sorters')

local M = {}
require'neuron'.setup {
    virtual_titles = true,
    mappings = true,
    run = nil, -- function to run when in neuron dir
    neuron_dir = "~/notes", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
    leader = "<leader>z", -- the leader key to for all mappings, remember with 'go zettel'
}


function M.search_todos()
    require('telescope.builtin').grep_string {
        search="TODO",
        cwd="~/notes",
        file_sorter = sorters.get_fzy_sorter,
        generic_sorter = sorters.get_fzy_sorter,
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--vimgrep',
        },
    }
end


return M
