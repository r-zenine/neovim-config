local function file_exists(file)
  local f = io.open(file, "rb")
  if f then f:close() end
  return f ~= nil
end

local function lines_from(file)
  if not file_exists(file) then return {} end
  local lines = {}
  for line in io.lines(file) do
    table.insert(lines, line)
  end
  return lines
end

local function write_lines(file, lines)
    local f, _ = io.open(file, "w+")
    io.output(f)
    if f ~= nil then
        for _, line in pairs(lines) do
            io.write(line)
            io.write('\n')
        end
        f.close()
    end
end


-- Returning a Lua table at the end allows fine control of the symbols that
-- will be available outside this file. By returning the table, it allows the
-- importer to decide what name to use in their own code.
--
-- Examples:
--    local ds = require('myluamodule/definestuff')
--    ds.show_stuff()
--    local definestuff = require('myluamodule/definestuff')
--    definestuff.show_stuff()
return {
    file_exists = file_exists,
    lines_from = lines_from,
    write_lines = write_lines
}
