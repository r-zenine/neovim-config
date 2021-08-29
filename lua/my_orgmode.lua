require('orgmode').setup({
  org_agenda_files = {'~/Documents/org/*'},
  org_default_notes_file = '~/Documents/org/refile.org',
})

-- vim.g.completion_chain_complete_list = {
--   org = {
--     { mode = 'omni'},
--   },
-- }
-- vim.cmd[[autocmd FileType org setlocal iskeyword+=:,#,+]]
