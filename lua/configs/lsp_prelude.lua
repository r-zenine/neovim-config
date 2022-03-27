local kb = require('prelude.keybindings')
local M = {}

function M.on_attach(client, bufnr)
    local buf_set_option = vim.api.nvim_buf_set_option
    buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts_kb = {noremap = false, silent = false, buffer = bufnr}

    kb.local_bind("Rename", 'r',  '<cmd>lua vim.lsp.buf.rename()<CR>', opts_kb)
    kb.local_bind("Code Action", 'c', '<cmd>Telescope lsp_code_actions theme=cursor<CR>', opts_kb)

    -- TODO move all of these to use telescope
    kb.local_section("g", "Go To")
    kb.local_bind("Definition", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>", opts_kb)
    kb.local_bind("Declaration", "gc", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts_kb)
    kb.local_bind("Implementation", 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts_kb)
    kb.local_bind("Type definition",'gt', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts_kb)
    kb.local_bind("References", 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts_kb)

    kb.local_section("p", "Peek")
    kb.local_bind("Documentation", 'pd', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts_kb)
    kb.local_bind("Browse Documentation", 'pb', '<Cmd>lua vim.lsp.buf.hover()<CR><Cmd>lua vim.lsp.buf.hover()<CR>', opts_kb)
    kb.local_bind("Signature", 'ps', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts_kb)

    if client.resolved_capabilities.call_hierarchy then
        kb.local_bind("Incoming calls", 'pi', '<cmd>lua vim.lsp.buf.incoming_calls()<CR>', opts_kb)
        kb.local_bind("Outgoing calls", 'po', '<cmd>lua vim.lsp.buf.outgoing_calls()<CR>', opts_kb)
    end

    kb.local_section("d", "Diagnostic")
    kb.local_bind("Next", 'dn', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts_kb)
    kb.local_bind("Previous", 'dp', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts_kb)
    kb.local_bind("Explain", "de", '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>',opts_kb)
    kb.local_bind("To Loclist", "dl", '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts_kb)

    kb.local_section("w", "Workspace")
    kb.local_bind("Add folder",'wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts_kb)
    kb.local_bind("Remove folder",'wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts_kb)
    kb.local_bind("List folders",'wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts_kb)
    -- Set some keybinds conditional on server capabilities
    if client.resolved_capabilities.document_formatting then
        kb.local_bind("Format", 'f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts_kb)
        vim.api.nvim_exec([[
            autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting()
        ]], false)
    elseif client.resolved_capabilities.document_range_formatting then
        kb.local_bind("Format", 'f', '"<cmd>lua vim.lsp.buf.range_formatting()<CR>', opts_kb)
    end

    if client.resolved_capabilities.eexecute_command then
        kb.local_bind("Execute Command", 'e', '"<cmd>lua vim.lsp.buf.execute_command()<CR>', opts_kb)
    end
    kb.local_section('t', 'Tests')
    kb.local_bind('Nearest', 'tt', ':TestNearest<CR>', opts_kb)
    kb.local_bind('Last', 'tl', ':TestLast<CR>', opts_kb)
    kb.local_bind('File', 'tf', ':TestFile<CR>', opts_kb)

    kb.local_section('s', 'Send to Repl')
    kb.local_bind('Send File', 'sf', ':TREPLSendFile<CR>', opts_kb)
    kb.local_bind('Send Line', 'sl', ':TREPLSendLine<CR>', opts_kb)
    kb.local_bind('Send Selection', 'ss', ':TREPLSendSelection<CR>', opts_kb)
    kb.local_bind('Send File', 'sf', ':TREPLSendFile<CR>', opts_kb)

    kb.local_section('D', 'Debug')
    kb.local_bind('Continue', 'Dc', ':lua require\'dap\'.continue()<CR>', opts_kb)
    kb.local_bind('Step Over', 'Dso', ':lua require\'dap\'.step_over()<CR>', opts_kb)
    kb.local_bind('Step Into', 'Dsi', ':lua require\'dap\'.step_into()<CR>', opts_kb)
    kb.local_bind('Step Out', 'DsO', ':lua require\'dap\'.step_out()<CR>', opts_kb)
    kb.local_section("Db", "Breakpoints")
    kb.local_bind('Breakpoint', 'Dbb', ':lua require\'dap\'.toggle_breakpoint()<CR>', opts_kb)
    kb.local_bind('Conditional Breakpoint', 'Dbc', ':lua require\'dap\'.set_breakpoint(vim.fn.input(\'Breakpoint condition: \'))<CR>', opts_kb)
    kb.local_bind('Log Breakpoint', 'Dbl',':lua require\'dap\'.set_breakpoint(nil, nil, vim.fn.input(\'Log point message: \'))<CR>', opts_kb)
    kb.local_bind('Repl', 'Dr',':lua require\'dap\'.repl.open()<CR>', opts_kb)
    kb.local_bind('Run Last', 'DL',':lua require\'dap\'.run_last()<CR>', opts_kb)
end

function M.prelude_attach(client, bufnr)
   M.on_attach(client, bufnr)
end

return M

