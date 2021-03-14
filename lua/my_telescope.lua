local M = {}
local sorters = require('telescope.sorters')
local actions = require('telescope.actions')
local themes = require('telescope.themes')

local function send_to_qflist(prompt_bufnr)
    actions.smart_send_to_qflist(prompt_bufnr)
    vim.cmd(':copen')
    vim.cmd(':cfirst')
end

require('telescope').setup{
    defaults = {
      mappings = {
       i = {
            ["<esc>"] = actions.close,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-q>"] = send_to_qflist,
          },
      },
    },
}

function M.live_grep()
    require('telescope.builtin').live_grep {
        shorten_path=false,
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
        prompt_title='<VIMRC>',
        cwd='~/.config/nvim',
        shorten_path=false,
        layout_strategy='horizontal',
        file_sorter = sorters.get_fzy_sorter,
        generic_sorter = sorters.get_fzy_sorter,
    }
end

function M.git_files()
    require('telescope.builtin').git_files {
        shorten_path=false,
        layout_strategy='horizontal',
        file_sorter = sorters.get_fzy_sorter,
        generic_sorter = sorters.get_fzy_sorter,
    }
end


function M.buffers()
    require('telescope.builtin').buffers(themes.get_dropdown {
        previewer = false,
        winblend = 10,
        sort_lastused = true,
    })
end

return M

