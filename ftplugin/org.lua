local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
  install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
  },
  filetype = 'org',
}

require'compe'.setup {
       source = {
           path = true;
           buffer = true;
           calc = true;
           nvim_lsp = false;
           nvim_lua = false;
           vsnip = false;
           ultisnips = false;
           luasnip = false;
           orgmode = true;
       };
    }
