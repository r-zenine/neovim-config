local lsp_prelude = require('configs.lsp_prelude')
local kb = require'prelude.keybindings'
local cpp_root_path = vim.fn.stdpath('data')..'/lspinstall/cpp/'
local clang_binary = cpp_root_path..'clangd/bin/clangd'

local M = {}

local function on_attach(client, bufnr)
    lsp_prelude.prelude_attach(client, bufnr)
    --lua vim.lsp.buf.execute_command({command="textDocument/switchSourceHeader", arguments = {vim.api.nvim_buf_get_name(0)}}
end

local clangd_config = {
      on_attach = on_attach,
      cmd = {
          clang_binary,
          "--background-index",
          "--suggest-missing-includes",
          "--cross-file-rename",
          "-clang-tidy",
      };
}


function M.setup()
    local lspconfig = require('lspconfig')
    lspconfig.clangd.setup(clangd_config)
end

return M
