return {
	-- Detect tabstop and shiftwidth automatically
	{ "tpope/vim-sleuth" },

	-- Useful plugin to show you pending keymaps
	{
		"folke/which-key.nvim",
		event = "VimEnter",
		opts = {
			delay = 0,
			icons = {
				mappings = false,
			},
			win = {
				border = "single",
			},
			spec = {
				{ "<leader>c", group = "[C]ode", mode = { "n", "x" } },
				{ "<leader>r", group = "[R]ename" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>t", group = "[T]oggle or [T]ab" },
				{ "<leader>g", group = "[G]it" },
				{ "<leader>l", group = "[L]SP" },
			},
		},
	},

	-- Add indentation guides even on blank lines
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		opts = {
			indent = {
				char = "┊",
				smart_indent_cap = false,
			},
			scope = {
				enabled = false,
				-- Uncomment if enabled
				-- show_start = false,
			},
		},
	},

	-- "gc" to comment visual regions/lines
	-- Note: Neovim 0.10 has this by default, but it uses "/* */" instead of "//" which I dislike
	{ "numToStr/Comment.nvim", opts = {} },

	-- File explorer that lets you edit as a buffer
	{
		"stevearc/oil.nvim",
		opts = {},
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},

	-- Status line
	{
		"nvim-lualine/lualine.nvim",
		opts = {
			options = {
				icons_enabled = false,
				theme = "gruvbox-material",
				component_separators = "|",
				section_separators = "",
			},
		},
	},

	-- Markdown Previewer
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function()
			vim.fn["mkdp#util#install"]()
		end,
	},
}
