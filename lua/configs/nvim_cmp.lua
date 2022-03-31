local cmp = require'cmp'
local M = {}

function M.setup()
    local snippets = {
           expand = function(args)
               require('luasnip').lsp_expand(args.body)
           end,
       }
    local mappings = {
           ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
           ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
           ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
           ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
           ['<C-e>'] = cmp.mapping({
               i = cmp.mapping.abort(),
               c = cmp.mapping.close(),
           }),
           ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
       }
    cmp.setup({
       snippet = snippets,
       mapping = mappings,
       sources = cmp.config.sources({
           { name = 'nvim_lsp', priority = 1},
           { name = 'nvim_lsp_signature_help', priority = 1 },
           { name= 'neorg' },
       }, {
           { name= 'buffer' },
       })
   })

   --[[ cmp.setup.filetype({'norg'}, {
       snippet = snippets,
       mapping = mappings,
       sources = cmp.config.sources({
           { name = 'nvim_lsp'},
           { name = 'nvim_lsp_signature_help' },
           { name= 'luasnip' },
       }, {
           { name= 'buffer' },
       }),
   }) ]]
   -- local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
end
return M
