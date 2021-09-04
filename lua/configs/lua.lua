-- set the path to the sumneko installation; if you previously installed via the now deprecated :LspInstall, use
local lsp_prelude=require('configs.lsp_prelude')

local sumneko_root_path = vim.fn.stdpath('data')..'/lspinstall/lua/'
local sumneko_binary = sumneko_root_path..'sumneko-lua-language-server'

local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

-- Make the server aware of Neovim runtime files
local library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}

local lua_config = {
      on_attach = lsp_prelude.prelude_attach,
      cmd = {sumneko_binary};
      settings = {
        Lua = {
          runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
              -- Setup your lua path
              path = runtime_path,
          },
          diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'},
          },
          workspace = {
              -- Make the server aware of Neovim runtime files
              library = library,
          },
          -- Do not send telemetry data containing a randomized but unique identifier
          telemetry = {
              enable = false,
              },
          },
  },
}

local M= {}

function M.setup()
    local lspconfig = require('lspconfig')
    lspconfig.sumneko_lua.setup(lua_config)
end

return M
