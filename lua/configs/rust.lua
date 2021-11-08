local lsp_prelude = require('configs.lsp_prelude')
local kb = require'prelude.keybindings'

local rust_root_path = vim.fn.stdpath('data')..'/lspinstall/rust/'
local rust_analyzer_binary = rust_root_path..'rust-analyzer'


local M = {}

local function on_attach(client, bufnr)
    lsp_prelude.prelude_attach(client, bufnr)
    local opts_kb = {noremap = false, silent = false, buffer = bufnr}
    kb.local_section("Debug", "D")
    kb.local_bind("Debug", "Dd", ":RustDebuggables<CR>", opts_kb)
    kb.local_bind("Run", "R", ":RustRunnables<CR>", opts_kb)
    kb.local_bind("Parent module", "gp", ":RustParentModule<CR>", opts_kb)
end

local rust_config = {
      on_attach = on_attach,
      cmd = {rust_analyzer_binary};
      settings = {
        ["rust-analyzer.rustfmt.enableRangeFormatting"] = false,
      },
}

function M.cargo_keybindings(bufnr)
    local opts_kb = {noremap = false, silent = false, buffer = bufnr}
    kb.local_section("Dependencies", "D")
    kb.local_bind("Update Dependency", "Du", ":lua require'crates'.update_crate()<cr>", opts_kb)
    kb.local_bind("Upgrade Dependency", "DU", ":lua require'crates'.upgrade_crate()<cr>", opts_kb)
    kb.local_bind("Update Dependency", "Da", ":lua require'crates'.update_all_crates()<cr>", opts_kb)
    kb.local_bind("Upgrade Dependency", "DA", ":lua require'crates'.upgrade_all_crates()<cr>", opts_kb)
end

function M.setup()
    require('rust-tools').setup({server = rust_config})
    require('crates').setup()
end

return M
