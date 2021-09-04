local wk = require("which-key")

local M={}

local keybindings_table = {}
local locleader_keybindings_table = {}


local function refresh_leader()
    wk.register(keybindings_table, {prefix = '<Leader>', mode='n'})
    wk.register(locleader_keybindings_table, {prefix = '<LocalLeader>', mode='n'})
end

local function _section(kt, binding, name)
    local cursor = kt
    for i=1, #binding do
        local byte = binding:sub(i,i)
        if cursor[byte] == nil then
            cursor[byte] = {}
        end
        cursor = cursor[byte]
        if i == #binding  then
            cursor['name'] = name
        end
    end
end

local function _bind(kt, name, binding, cmd, options)
    local cursor = kt
    for i=1, #binding do
        local byte = binding:sub(i,i)
        if cursor[byte] == nil and i ~= #binding then
            cursor[byte] = {}
        end
        if i ~= #binding then
            cursor = cursor[byte]
        end
        if i == #binding  then
            cursor[byte] = { cmd, name }
            for key, value in pairs(options) do
                cursor[byte][key] = value
            end
        end
    end

end

function M.section(binding, name)
    _section(keybindings_table, binding, name)
    refresh_leader()
end

-- Enrich the which-key keybinding table
function M.bind(name, binding, cmd, options)
    _bind(keybindings_table, name, binding, cmd, options)
    refresh_leader()
end

function M.local_section(binding, name)
    _section(locleader_keybindings_table, binding, name)
    refresh_leader()
end
-- Enrich the which-key keybinding table
function M.local_bind(name, binding, cmd, options)
    _bind(locleader_keybindings_table, name, binding, cmd, options)
    refresh_leader()
end

function M.locleader_bindings()
    print(vim.inspect(locleader_keybindings_table))
end

return M


