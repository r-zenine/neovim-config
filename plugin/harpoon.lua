local kb = require'prelude.keybindings'

local opts = {noremap = false, silent = false}

kb.section('h', 'Harpoon')
kb.bind('Buffer', 'hb', ':lua require("harpoon.mark").add_file()<CR>', opts)
kb.bind('Marks', 'hm', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', opts)

kb.bind('Mark 1', 'h1', ':lua require("harpoon.ui").nav_file(1)<CR>', opts)
kb.bind('Mark 2', 'h2', ':lua require("harpoon.ui").nav_file(2)<CR>', opts)
kb.bind('Mark 3', 'h3', ':lua require("harpoon.ui").nav_file(3)<CR>', opts)
kb.bind('Mark 4', 'h4', ':lua require("harpoon.ui").nav_file(4)<CR>', opts)
kb.bind('Mark 5', 'h5', ':lua require("harpoon.ui").nav_file(5)<CR>', opts)

