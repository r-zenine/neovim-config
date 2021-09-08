-- Disable builtin plugins
local disabled_builtins = {
    'man',
    'netrw',
    'netrwPlugin',
    'netrwSettings',
    'netrwFileHandlers',
    'gzip',
    'zip',
    'zipPlugin',
    'tar',
    'tarPlugin',
    'getscript',
    'getscriptPlugin',
    'vimball',
    'vimballPlugin',
    '2html_plugin',
    'logipat',
    'rrhelper',
    'matchit',
}

for _, plugin in ipairs(disabled_builtins) do
    vim.g['loaded_' .. plugin] = 1
end
