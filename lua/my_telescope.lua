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
        file_ignore_patterns = {'*/pack/plug/*'},
        layout_strategy='horizontal',
        file_sorter = sorters.get_fzy_sorter,
        recurse_submodules=false,
        generic_sorter = sorters.get_fzy_sorter,
    }
end

function M.org_notes()
    require('telescope.builtin').find_files {
        prompt_title='<ORG notes>',
        cwd='~/Documents/org',
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

function M.marks()
    require('telescope.builtin').marks()
end

function M.quickfix()
    require('telescope.builtin').quickfix()
end

function M.locllist()
    require('telescope.builtin').loclist()
end

return M

