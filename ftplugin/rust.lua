local opt = vim.opt
local utils = require'prelude.utils'

local wildignores = {'*/.cargo/*','*/target/*'}
utils.insert_all(opt.wildignore, wildignores)

table.insert(opt.path,  vim.env.HOME..'/.cargo/bin')
