local kb = require('prelude.keybindings')

local M = {}

function M.on_attach(client, bufnr)
    local buf_set_option = vim.api.nvim_buf_set_option
    buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local opts_kb = {noremap = false, silent = false, buffer = bufnr}

    kb.local_bind("Rename", 'r',  '<cmd>lua vim.lsp.buf.rename()<CR>', opts_kb)
    kb.local_bind("Code Action", 'c', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts_kb)

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

    if client.resolved_capabilitieseexecute_command then
        kb.local_bind("Execute Command", 'e', '"<cmd>lua vim.lsp.buf.execute_command()<CR>', opts_kb)
    end
    -- Set autocommands conditional on server_capabilities
    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_exec([[
        hi LspReferenceRead cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceText cterm=bold ctermbg=red guibg=LightYellow
        hi LspReferenceWrite cterm=bold ctermbg=red guibg=LightYellow
        augroup lsp_document_highlight
        autocmd! * <buffer>
        autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        augroup END
        ]], false)
    end
end


function M.prelude_attach(client, bufnr)
   M.on_attach(client, bufnr)
   require'completion'.on_attach()
end

return M

