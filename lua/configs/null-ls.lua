local M = {}
local null_ls = require'null-ls'

function M.setup()
    null_ls.setup({
        sources = {
            null_ls.builtins.formatting.stylua,
            null_ls.builtins.completion.spell,
            null_ls.builtins.code_actions.gitsigns,
            -- requires luarocks install --server=https://luarocks.org/dev luaformatter
            null_ls.builtins.formatting.lua_format,
            null_ls.builtins.code_actions.refactoring,
        },
    })
end

return M
