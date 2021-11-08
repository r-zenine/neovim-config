local lsp_prelude = require('configs.lsp_prelude')
local kb = require'prelude.keybindings'
local go_root_path = vim.fn.stdpath('data')..'/lspinstall/go/'
local gopls_binary = go_root_path..'gopls'

local M = {}

local function on_attach(client, bufnr)
    lsp_prelude.prelude_attach(client, bufnr)
    local opts_kb = {noremap = false, silent = false, buffer = bufnr}

    kb.local_bind("Impl", "i", [[<cmd>lua require'telescope'.extensions.goimpl.goimpl{}<CR>]], opts_kb)

    kb.local_bind("Alt File", "ga", [[:GoAlt!<CR>]], opts_kb)

    kb.local_section("F", "Fill")
    kb.local_bind("Struct", "Fs", [[:GoFillStruct<CR>]], opts_kb)
    kb.local_bind("Switch", "FS", [[:GoFillSwitch<CR>]], opts_kb)
    kb.local_bind("Err", "Fe", [[:GoIfErr<CR>]], opts_kb)
    kb.local_bind("Struct Comment", "Fc", [[:lua.require('go.comment').gen()<CR>]], opts_kb)

    kb.local_section("D", "Debug")
    kb.local_bind("Start", "Ds", ":GoDebug<CR>", opts_kb)
    kb.local_bind("Nearest", "Dn", ":GoDebug nearest<CR>", opts_kb)
    kb.local_bind("Breakpoint", "Db", ":GoBreakToggle<CR>", opts_kb)
    kb.local_bind("Conditional Breakpoint", "Dc", ":GoBreakCondition<CR>", opts_kb)
    kb.local_bind("Stop", "DS", ":GoDbgStop<CR>", opts_kb)
end

local go_config = {
      on_attach = on_attach,
      cmd = {gopls_binary};
      settings = {},
}


function M.setup()
    local lspconfig = require('lspconfig')
    lspconfig.gopls.setup(go_config)
    require'go'.setup({
        lsp_cfg=false
    })

    -- Format on save
    -- vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').gofmt() ]], false)

    -- Import on save
    vim.api.nvim_exec([[ autocmd BufWritePre *.go :silent! lua require('go.format').goimport() ]], false)
end

return M
