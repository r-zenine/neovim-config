local M = {}
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')

require('telescope').setup{
    defaults = {
      mappings = {
       i = {
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
          },
      },
    },
}

function M.live_grep()
    require('telescope.builtin').live_grep {
        shorten_path=true,
        layout_strategy='horizontal',
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

function M.git_files_nvim()
    require('telescope.builtin').git_files {
        cwd='~/.config/nvim',
        shorten_path=false,
        layout_strategy='horizontal',
        file_sorter = sorters.get_fzy_sorter,
        generic_sorter = sorters.get_fzy_sorter,
    }
end

function M.git_files()
    require('telescope.builtin').git_files {
        shorten_path=true,
        layout_strategy='horizontal',
        file_sorter = sorters.get_fzy_sorter,
        generic_sorter = sorters.get_fzy_sorter,
    }
end



return M
