local M = {}

local function on_attach(client, bufnr)
    lsp_prelude.prelude_attach(client, bufnr)
end

local python_config = {
      on_attach = on_attach,
}


function M.setup()
    require'lspconfig'.pylsp.setup{}
end

return M
