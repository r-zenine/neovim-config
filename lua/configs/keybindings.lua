local kb = require'prelude.keybindings'
local vimp = require'vimp'


local opts = {noremap = false, silent = false}

kb.section('b', 'Buffers')
kb.bind('Previous', 'bp', ':bp<CR>', opts)
kb.bind('Next', 'bn', ':bn<CR>', opts)
kb.bind('Delete', 'bd', ':bdelete<CR>', opts)
kb.bind('List', 'bl', ':lua require("my_telescope").buffers()<CR>', opts)

kb.section('g', 'Git')
kb.bind("Status", "gg", ":Neogit<CR>", opts)
kb.bind("Branches", "gc", ':Telescope git_branches', opts)
kb.bind("Log", "gl", ':Telescope git_commits', opts)
kb.bind("Log buffer", "gb", ':Telescope git_bcommits', opts)

kb.section('o', 'Org mode')
kb.bind("Files", "of", ":lua require('my_telescope').org_notes()<CR>", opts)

kb.section('p', 'Project')
kb.bind("Find Files", "pf", ":lua require'my_telescope'.git_files()<CR>", opts)
kb.bind("Find Marks", "pm", ":lua require'my_telescope'.marks()<CR>", opts)
kb.bind("Change Project", "pp", ":call tlbd#move_to_directory()<CR>", opts)
kb.bind("Load Session", "psl", ":source Session.vim<CR>", opts)
kb.section('ps', 'Sessions')
kb.bind("Save Session", "pss", ":mksession!<CR>", opts)

kb.section('q', 'Quickfix')
kb.bind("Close", "qc", ":cclose<CR>", opts)
kb.bind("First", "qf", ":cfirst<CR>", opts)
kb.bind("Last", "ql", ":clast<CR>", opts)
kb.bind("Next", "qn", ":cnext<CR>", opts)
kb.bind("Previous", "qp", ":cprev<CR>", opts)

kb.section('l', 'Loclist')
kb.bind("Close", "lc", ":lclose<CR>", opts)
kb.bind("First", "lf", ":lfirst<CR>", opts)
kb.bind("Last", "ll", ":llast<CR>", opts)
kb.bind("Next", "ln", ":lnext<CR>", opts)
kb.bind("Previous", "lp", ":lprev<CR>", opts)

kb.section('s', 'Search')
kb.bind("Search In project", "sp" ,":Telescope live_grep<CR>", opts)
kb.bind("Search Current Sring", "ss" ,":Telescope grep_string<CR>", opts)

kb.section('t', 'Terminal')
kb.bind('Terminal', 'tt', ':botright Ttoggle<CR>', opts)
-- TODO add features to:
-- Search for open terminals
-- Rename a terminal

kb.section('w', 'Window')
kb.bind('Next Tab', 'wt', ':tabNext<CR>', opts)
kb.bind('New Tab', 'wT', ':tabnew<CR>', opts)
kb.bind('Close', 'wc', ':close<CR>', opts)
kb.bind('Twilight mode', 'ww', ':Twilight<CR>', opts)
kb.bind('Split', 'ws', ':split<CR>', opts)
kb.bind('Vertical Split', 'wv', ':vsplit<CR>', opts)

kb.bind('Down', 'wj', '<C-W>j<CR>', opts)
kb.bind('Up', 'wk', '<C-W>k<CR>', opts)
kb.bind('Left', 'wh', '<C-W>h<CR>', opts)
kb.bind('Right', 'wl', '<C-W>l<CR>', opts)

vimp.tnoremap('<leader>wj', '<C-\\><C-n><C-w>j')
vimp.tnoremap('<leader>wk', '<C-\\><C-n><C-w>k')
vimp.tnoremap('<leader>wl', '<C-\\><C-n><C-w>l')
vimp.tnoremap('<leader>wh', '<C-\\><C-n><C-w>h')
vimp.tnoremap('<leader>wc', '<C-\\><C-n><C-w>c')
vimp.tnoremap('<leader>ws', '<C-\\><C-n>:split<CR>')
vimp.tnoremap('<leader>wv', '<C-\\><C-n>:vsplit<CR>')

kb.section('v', 'Vim configuration')
kb.bind('Open vimrc', 've', ':e $MYVIMRC<CR>', opts)
kb.bind('Reload vimrc', 'vr', ':source $MYVIMRC<CR>', opts)
kb.bind('Open config file', 'vf' ,':lua require("my_telescope").git_files_nvim()<CR>', opts)
kb.bind('Install plugins', 'vp' ,':PlugInstall<CR>', opts)
kb.bind('Clean plugins', 'vc' ,':PlugClean<CR>', opts)


vimp.nmap('gr', '<Plug>(neoterm-repl-send)')
vimp.xmap('gr', '<Plug>(neoterm-repl-send)')
