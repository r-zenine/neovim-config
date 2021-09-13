-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local lsp_prelude=require('configs.lsp_prelude')
local utils = require'prelude.utils'

local sumneko_root_path = vim.fn.stdpath('data')..'/lspinstall/lua/'
local sumneko_binary = sumneko_root_path..'sumneko-lua-language-server'


local M= {}

local library = {}

utils.insert_all(library, vim.api.nvim_get_runtime_file("lua/*/*.lua", true))
utils.insert_all(library, vim.api.nvim_get_runtime_file("lua/*.lua", true))

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")


local lua_config = {
    on_attach = lsp_prelude.prelude_attach,
    cmd = {sumneko_binary},
}

function M.setup()
    local luadev = require'lua-dev'.setup({
        lspconfig = lua_config,
        library = {
            vimruntime = true, -- runtime path
            types = true, -- full signature, docs and completion of vim.api, vim.treesitter, vim.lsp and others
            plugins = true, -- installed opt or start plugins in packpath
        },
    })
    local lspconfig = require('lspconfig')
    lspconfig.sumneko_lua.setup(luadev)
end

return M
