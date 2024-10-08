-- Miscellaneous plugins
return {
	-- Detect tabstop and shiftwidth automatically
	{ 'tpope/vim-sleuth' },

	-- Enable editing surroundings
	{ 'tpope/vim-surround' },

	-- Useful plugin to show you pending keymaps
	{
		'folke/which-key.nvim',
		event = 'VimEnter',
		opts = {
			icons = {
				mappings = false,
			},
			win = {
				border = "single",
			},
			spec = {
				{ '<leader>c', group = '[C]ode',        mode = { 'n', 'x' } },
				{ '<leader>d', group = '[D]ocument' },
				{ '<leader>r', group = '[R]ename' },
				{ '<leader>s', group = '[S]earch' },
				{ '<leader>t', group = '[T]oggle/[T]ab' },
				{ '<leader>g', group = '[G]it' },
				{ '<leader>l', group = '[L]SP' },
			},
		}
	},

	-- Add indentation guides even on blank lines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "┊",
				smart_indent_cap = false
			},
			scope = {
				enabled = false,
				-- Uncomment if enabled
				-- show_start = false,
			},
		}
	},

	-- "gc" to comment visual regions/lines
	-- Note: Neovim 0.10 has this by default, but it uses "/* */" instead of "//" which I dislike
	{ 'numToStr/Comment.nvim', opts = {} },

	-- File explorer that lets you edit as a buffer
	{
		'stevearc/oil.nvim',
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Highlight the current word under the cursor
	{ 'RRethy/vim-illuminate' },
}
