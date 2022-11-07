-- This file contains all the references to the desired plugins

-- Automatically install Packer
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Install desired plugins here
return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Gruvbox theme
	use 'ellisonleao/gruvbox.nvim'

	-- Completion
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-buffer'
	use 'hrsh7th/cmp-path'
	use 'hrsh7th/cmp-cmdline'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'L3MON4D3/LuaSnip'

	-- LSP 
	use {
    	"williamboman/mason.nvim",
    	"williamboman/mason-lspconfig.nvim",
    	"neovim/nvim-lspconfig",
	}

	-- Nvim Tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
  		}
	}

	-- Fuzzy Finder (Telescope) and LazyGit
	use 'nvim-telescope/telescope.nvim'
	use 'nvim-lua/plenary.nvim'

	-- Syntax Highlighting (Treesitter)
	use {
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate',
	}

	-- Git
	use 'lewis6991/gitsigns.nvim'

	-- Buffer line 
	use 'akinsho/bufferline.nvim'
	use 'moll/vim-bbye'

	-- Misc
	use {
		'windwp/nvim-autopairs',
    	config = function() require('nvim-autopairs').setup {} end
	}
	use {
		'numToStr/Comment.nvim',
    	config = function()
        	require('Comment').setup()
    	end
	}
	use 'tpope/vim-surround'
end)
