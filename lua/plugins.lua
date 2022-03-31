local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/stat/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

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
    -- Colorscheme & look n feel
    use {
        "rafamadriz/neon",
        'kyazdani42/nvim-web-devicons',
        'luukvbaal/stabilize.nvim'
    }
    -- Windows and tabs
    use { "beauwilliams/focus.nvim", config = function() require("focus").setup() end }

    -- Config helper
    use 'svermeulen/vimpeccable'

    -- Telescope
    use {'nvim-telescope/telescope.nvim',
        requires = {'nvim-lua/plenary.nvim'} }
    use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make',
        requires = {"nvim-telescope/telescope.nvim"},
        config = function() require"telescope".load_extension("fzf") end}

    -- navigation & files management
    use {'ThePrimeagen/harpoon', requires = { 'nvim-lua/plenary.nvim' } }
    use {'ThePrimeagen/refactoring.nvim', requires = { 'nvim-lua/plenary.nvim', "nvim-treesitter/nvim-treesitter"} }

    -- editing helpers
    -- Expands the use of . to repeat last commands
    use 'tpope/vim-repeat'
    -- Comments
    use 'b3nj5m1n/kommentary'
    -- Git
    -- TODO get rid of fugitive
    use 'tpope/vim-fugitive'
    use 'TimUntersberger/neogit'
    use {
        'lewis6991/gitsigns.nvim',
        config = function()
            require('gitsigns').setup()
        end
    }
    --
    -- teesitter
    use {'nvim-treesitter/nvim-treesitter', run = ':TSUpdate'}
    -- LSP
    use 'neovim/nvim-lspconfig' -- Collection of configurations for the built-in LSP client
    use 'williamboman/nvim-lsp-installer'
    use {
      "jose-elias-alvarez/null-ls.nvim",
      requires = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig"},
    }
    -- snippets
    use {'L3MON4D3/LuaSnip'}
    -- completion setup
    use {
        'hrsh7th/nvim-cmp',
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lsp-signature-help',
    }
    -- improvements to the lsp ui
    use {'ray-x/navigator.lua', requires = {'ray-x/guihua.lua', run = 'cd lua/fzy && make'}}

    -- dap
    use 'mfussenegger/nvim-dap'
    use {"rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use {'nvim-telescope/telescope-dap.nvim',
        requires = {"nvim-telescope/telescope.nvim"},
        config = function() require"telescope".load_extension("dap") end}
    use {'theHamsta/nvim-dap-virtual-text',
        requires= { 'nvim-treesitter/nvim-treesitter', 'mfussenegger/nvim-dap'},
        config = function() require("nvim-dap-virtual-text").setup() end }

    -- tests
    use 'janko-m/vim-test'

    -- visual leader
    use 'folke/which-key.nvim'

    -- orgmode
    use {
      "vhyrro/neorg",
      config = function()
        require("my_neorg").setup()
      end,
      requires = "nvim-lua/plenary.nvim",
    }
    use "nvim-neorg/neorg-telescope"

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
    use {"folke/lua-dev.nvim"}

    -- python
    use {'rafi/vim-venom',  ft = 'python'}
    -- scala
    use {'scalameta/nvim-metals', ft = 'scala'}
    -- tlbd -- TODO remove fugitive dependency
    use {path_tlbd,
        requires = {"tami5/sql.nvim", "nvim-telescope/telescope.nvim"}}
    -- sessions
    use 'rmagatti/auto-session'
end)
