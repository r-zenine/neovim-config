-- local Files = require('orgmode.parser.files')

 --[[ ---Triggered from org file when we want to refile headline
local function action_headline_to_destination()
    local actions = require("telescope.actions")
    local entry = actions.get_selected_entry()

    local agenda_file = Files.get_current_file()
    local item = agenda_file:get_closest_headline()
    local lines = agenda_file:get_headline_lines(item)
    return capture:_refile_content_with_fallback(lines, entry, item)
end

function M.telescope_refile()
    local sorters = require("telescope.sorters")
    require('telescope.builtin').find_files {
        prompt_title='<ORG notes>',
        cwd='~/Documents/org',
        shorten_path=false,
        layout_strategy='horizontal',
        file_sorter = sorters.get_fzy_sorter,
        generic_sorter = sorters.get_fzy_sorter,
        attach_mappings = function(_, map)
          map('i', '<CR>', action_headline_to_destination)
          return true
        end,
    }
end
 ]]

local default_notes = '~/Documents/org/'
local default_note_reports = default_notes..'reports.org'
local default_note_mgmt = default_notes..'mgmt.org'
local default_note_journal = default_notes..'journal.org'
local default_note_tasks = default_notes..'todos.org'
local default_note_meetings = default_notes..'meetings.org'
local default_note_neovim = default_notes..'neovim.org'

local M = {}
function M.setup()
    require('orgmode').setup({
        -- org agenda settings
        org_agenda_files = {'~/Documents/org/*'},
        org_agenda_skip_scheduled_if_done = false,
        org_agenda_skip_deadline_if_done = true,
        org_agenda_templates = {
             t = { description = 'Task', template = '* TODO %?\n %u', target = default_note_tasks} ,
             r = { description = 'Reports', template = '** %T Observation %?', target = default_note_reports},
             m = { description = 'Management Task ', template = '** TODO %T %?', target = default_note_mgmt},
             j = { description = 'Journal', template = '\n*** %<%Y-%m-%d> %<%A>\n**** %U\n\n%?', target = default_note_journal},
             M = { description = 'Management Task ', template = '** %T %?', target = default_note_meetings},
             n = { description = 'Neovim Config', template = '** TODO %T %?', target = default_note_neovim},
        },
        -- org refile settings
        org_default_notes_file = '~/Documents/org/refile.org',
    })
end

return M
