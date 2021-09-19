local opt = vim.opt
local cmd = vim.cmd  -- to execute Vim commands e.g. cmd('pwd')
local fn = vim.fn    -- to call Vim functions e.g. fn.bufnr()
local g = vim.g
local utils = require'prelude.utils'

cmd("silent! helptags ALL")
cmd('filetype plugin indent on')
cmd('syntax on')

opt.termguicolors=true
opt.background='dark'
opt.guifont='Fira Code,Retina:h14'

cmd('colorscheme github_dark')

opt.hidden=true                    -- Required to keep multiple buffers open in the background
opt.relativenumber=true            -- display relative numbers
opt.number=true                    -- displays the number of the current line
opt.hlsearch=false                 -- Stop the highlighting for the 'hlsearch' option.
opt.errorbells=false               -- no bells
opt.encoding='utf-8'               -- encoding utf-8
opt.pumheight=10                   -- Makes popup menu smaller
opt.ruler=false                    -- show the cursor position all the time
opt.showcmd=true
opt.tabstop=4
opt.softtabstop=4                  -- Insert 4 spaces for a tab
opt.shiftwidth=4                   -- Change the number of space characters inserted for indentation
opt.smarttab=true                  -- Makes tabbing smarter will realize you have 2 vs 4
opt.expandtab=true                 -- replaces tabs with spaces
opt.smartindent=true               -- Makes indenting smart
opt.autoindent=true                -- Copy indent from current line when inserting new one
opt.wrap=false                     -- dont wrap long lines
opt.smartcase=true
opt.incsearch=true
opt.scrolloff=8
opt.updatetime=500                 -- Faster completion
opt.completeopt = "menuone,noinsert"
opt.timeoutlen=250                 -- By default timeoutlen is 1000 ms
opt.clipboard='unnamedplus'        -- Copy paste between vim and everything else
opt.lazyredraw=true                -- improve scrolling performance when navigating through large results
opt.colorcolumn='80'
opt.inccommand='split'
opt.foldenable=false

g.loaded_matchparen = true

utils.insert_all(opt.iskeyword, '-', '_')

table.insert(opt.path, fn.stdpath('data'))


local wildignores = {
    '*/tmp/*',
    '*.so',
    '*.swp',
    '*.zip',
    '*/plugged/*',
    '*/pack/plug*',
    '*/node_modules/*',
    '*.swp'}
utils.insert_all(opt.wildignore, wildignores)

g.mapleader=' '
g.maplocalleader=','

