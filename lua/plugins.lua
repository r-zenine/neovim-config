vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local path_local_plugins = vim.fn.stdpath('config')..'/my_plugins/'
local path_tlbd = path_local_plugins..'tlbd'

return require('packer').startup(function(use)
    -- Packer to avoid removing it when launching :PackerSync
    use 'wbthomason/packer.nvim'
    -- Colorscheme
    use "rafamadriz/neon"
    use 'luukvbaal/stabilize.nvim'
    -- Config helper
    use 'svermeulen/vimpeccable'
    use 'b0o/mapx.lua'
    --         Telescope
    use {'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'} }

    use {'nvim-telescope/telescope-project.nvim',
        requires = {"nvim-telescope/telescope.nvim"}}

    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make',
        requires = {"nvim-telescope/telescope.nvim"},
        config = function() require"telescope".load_extension("fzf") end}
    use {'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' } }
    -- dev icons
    use 'kyazdani42/nvim-web-devicons'

    -- Windows and tabs
    use "beauwilliams/focus.nvim"
    use { "folke/twilight.nvim", config = function() require("twilight").setup {} end }
    -- editing helpers
    -- Expands the use of . to repeat last commands
    use 'tpope/vim-repeat'
    -- Comments
    use 'b3nj5m1n/kommentary'
    -- Git
    use 'tpope/vim-fugitive'
    use 'TimUntersberger/neogit'
    -- teesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'kabouzeid/nvim-lspinstall'
    use 'hrsh7th/nvim-compe'
    use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}

    -- dap
    use 'mfussenegger/nvim-dap'
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use {'nvim-telescope/telescope-dap.nvim',
        requires = {"nvim-telescope/telescope.nvim"},
        config = function() require"telescope".load_extension("dap") end}

    -- tests
    use 'janko-m/vim-test'
    -- linters 
    use 'mfussenegger/nvim-lint'
 
    -- visual leader
    use 'folke/which-key.nvim'

    -- orgmode
    use 'kristijanhusak/orgmode.nvim'
    use 'akinsho/org-bullets.nvim'

    -- Terminal & Repol
    use 'kassio/neoterm' -- Terminal wrappers and Repl support

    -- markdown
    use 'plasticboy/vim-markdown'

    -- rust
    use {'simrat39/rust-tools.nvim',
        requires = {
            'neovim/nvim-lspconfig',
            'nvim-lua/popup.nvim',
            'nvim-lua/plenary.nvim',
            'nvim-telescope/telescope.nvim',
            'mfussenegger/nvim-dap',
        } }
    use { 'Saecki/crates.nvim', requires = { 'nvim-lua/plenary.nvim' } }


    --sql
    use 'tpope/vim-dadbod'
    use {'kristijanhusak/vim-dadbod-ui', requires = {'tpope/vim-dadbod'}}

    -- Go
    use {'ray-x/go.nvim',
        requires = {
            'neovim/nvim-lspconfig',
            'nvim-treesitter/nvim-treesitter',
            'mfussenegger/nvim-dap',
            'mfussenegger/nvim-dap-ui',
        } }
    use {
		'edolphin-ydf/goimpl.nvim',
		requires = {
			{'nvim-lua/plenary.nvim'},
			{'nvim-lua/popup.nvim'},
			{'nvim-telescope/telescope.nvim'},
			{'nvim-treesitter/nvim-treesitter'},
		},
		config = function()
			require'telescope'.load_extension'goimpl'
		end,
	}

    -- lua
    use "folke/lua-dev.nvim"

    -- python
    use {'rafi/vim-venom',  ft = 'python'}
    -- scala
    use 'scalameta/nvim-metals'
    -- tlbd
    use {path_tlbd,
        requires = {"tami5/sql.nvim", "nvim-telescope/telescope.nvim"}}
    -- sessions
    use 'rmagatti/auto-session'
end)
