-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = false
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/Users/ryad/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?.lua;/Users/ryad/.cache/nvim/packer_hererocks/2.1.0-beta3/share/lua/5.1/?/init.lua;/Users/ryad/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?.lua;/Users/ryad/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/Users/ryad/.cache/nvim/packer_hererocks/2.1.0-beta3/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["auto-session"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/auto-session"
  },
  ["crates.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/crates.nvim"
  },
  ["focus.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/focus.nvim"
  },
  ["go.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/go.nvim"
  },
  ["goimpl.nvim"] = {
    config = { "\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\vgoimpl\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/goimpl.nvim"
  },
  ["guihua.lua"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/guihua.lua"
  },
  kommentary = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/kommentary"
  },
  ["lua-dev.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/lua-dev.nvim"
  },
  ["mapx.lua"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/mapx.lua"
  },
  ["navigator.lua"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/navigator.lua"
  },
  neogit = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/neogit"
  },
  neon = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/neon"
  },
  neoterm = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/neoterm"
  },
  ["nvim-compe"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/nvim-compe"
  },
  ["nvim-dap"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/nvim-dap"
  },
  ["nvim-dap-ui"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/nvim-dap-ui"
  },
  ["nvim-dap-virtual-text"] = {
    loaded = true,
    needs_bufread = false,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/opt/nvim-dap-virtual-text"
  },
  ["nvim-lspconfig"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/nvim-lspconfig"
  },
  ["nvim-lspinstall"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/nvim-lspinstall"
  },
  ["nvim-metals"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/nvim-metals"
  },
  ["nvim-treesitter"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/nvim-treesitter"
  },
  ["nvim-web-devicons"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["org-bullets.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/org-bullets.nvim"
  },
  ["orgmode.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/orgmode.nvim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["popup.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/popup.nvim"
  },
  ["rust-tools.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/rust-tools.nvim"
  },
  ["sql.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/sql.nvim"
  },
  ["telescope-dap.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/telescope-dap.nvim"
  },
  ["telescope-frecency.nvim"] = {
    config = { "\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/telescope-frecency.nvim"
  },
  ["telescope-fzf-native.nvim"] = {
    config = { "\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0" },
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/telescope-fzf-native.nvim"
  },
  ["telescope-project.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/telescope-project.nvim"
  },
  ["telescope.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/telescope.nvim"
  },
  tlbd = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/tlbd"
  },
  ["twilight.nvim"] = {
    config = { "\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/twilight.nvim"
  },
  ["vim-dadbod"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/vim-dadbod"
  },
  ["vim-dadbod-ui"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/vim-dadbod-ui"
  },
  ["vim-fugitive"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/vim-fugitive"
  },
  ["vim-markdown"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/vim-markdown"
  },
  ["vim-repeat"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/vim-repeat"
  },
  ["vim-test"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/vim-test"
  },
  ["vim-venom"] = {
    loaded = false,
    needs_bufread = false,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/opt/vim-venom"
  },
  vimpeccable = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/vimpeccable"
  },
  ["which-key.nvim"] = {
    loaded = true,
    path = "/Users/ryad/.local/share/nvim/site/pack/packer/start/which-key.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: nvim-dap-virtual-text
time([[Setup for nvim-dap-virtual-text]], true)
try_loadstring("\27LJ\2\n2\0\0\2\0\3\0\0056\0\0\0009\0\1\0+\1\2\0=\1\2\0K\0\1\0\21dap_virtual_text\6g\bvim\0", "setup", "nvim-dap-virtual-text")
time([[Setup for nvim-dap-virtual-text]], false)
time([[packadd for nvim-dap-virtual-text]], true)
vim.cmd [[packadd nvim-dap-virtual-text]]
time([[packadd for nvim-dap-virtual-text]], false)
-- Config for: telescope-frecency.nvim
time([[Config for telescope-frecency.nvim]], true)
try_loadstring("\27LJ\2\nM\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\rfrecency\19load_extension\14telescope\frequire\0", "config", "telescope-frecency.nvim")
time([[Config for telescope-frecency.nvim]], false)
-- Config for: goimpl.nvim
time([[Config for goimpl.nvim]], true)
try_loadstring("\27LJ\2\nK\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\vgoimpl\19load_extension\14telescope\frequire\0", "config", "goimpl.nvim")
time([[Config for goimpl.nvim]], false)
-- Config for: telescope-fzf-native.nvim
time([[Config for telescope-fzf-native.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bfzf\19load_extension\14telescope\frequire\0", "config", "telescope-fzf-native.nvim")
time([[Config for telescope-fzf-native.nvim]], false)
-- Config for: twilight.nvim
time([[Config for twilight.nvim]], true)
try_loadstring("\27LJ\2\n:\0\0\3\0\3\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0004\2\0\0B\0\2\1K\0\1\0\nsetup\rtwilight\frequire\0", "config", "twilight.nvim")
time([[Config for twilight.nvim]], false)
-- Config for: telescope-dap.nvim
time([[Config for telescope-dap.nvim]], true)
try_loadstring("\27LJ\2\nH\0\0\3\0\4\0\a6\0\0\0'\2\1\0B\0\2\0029\0\2\0'\2\3\0B\0\2\1K\0\1\0\bdap\19load_extension\14telescope\frequire\0", "config", "telescope-dap.nvim")
time([[Config for telescope-dap.nvim]], false)
vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType python ++once lua require("packer.load")({'vim-venom'}, { ft = "python" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
vim.cmd("augroup END")
if should_profile then save_profiles() end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
