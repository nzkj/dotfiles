return {
	-- Git commands in Neovim
	-- Note: I do all my git in the terminal, but I like `:GBrowse`
	{ "tpope/vim-fugitive" },
	{ "tpope/vim-rhubarb" },

	-- Git signs in the sign column
	{
		"lewis6991/gitsigns.nvim",
		opts = {
			signs = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			signs_staged = {
				add = { text = "+" },
				change = { text = "~" },
				delete = { text = "_" },
				topdelete = { text = "‾" },
				changedelete = { text = "~" },
			},
			on_attach = function(bufnr)
				-- Navigating git hunks
				vim.keymap.set(
					"n",
					"<leader>gp",
					require("gitsigns").prev_hunk,
					{ buffer = bufnr, desc = "[G]it [P]revious Hunk" }
				)
				vim.keymap.set(
					"n",
					"<leader>gn",
					require("gitsigns").next_hunk,
					{ buffer = bufnr, desc = "[G]it [N]ext Hunk" }
				)
				vim.keymap.set(
					"n",
					"<leader>gv",
					require("gitsigns").preview_hunk,
					{ buffer = bufnr, desc = "[G]it [V]iew Hunk" }
				)

				-- Toggle git highlights in the current buffer
				vim.keymap.set(
					"n",
					"<leader>gb",
					require("gitsigns").toggle_current_line_blame,
					{ buffer = bufnr, desc = "[G]it [B]lame" }
				)
				vim.keymap.set(
					"n",
					"<leader>tl",
					require("gitsigns").toggle_linehl,
					{ buffer = bufnr, desc = "[T]oggle [L]ine Highlights" }
				)
				vim.keymap.set(
					"n",
					"<leader>tL",
					require("gitsigns").toggle_deleted,
					{ buffer = bufnr, desc = "[T]oggle Deleted [L]ine Highlights" }
				)
			end,
		},
	},

	-- View git changes in a diff view
	{
		"sindrets/diffview.nvim",
		config = function()
			local function get_default_branch_name()
				local res = vim.system({ "git", "rev-parse", "--verify", "main" }, { capture_output = true }):wait()
				return res.code == 0 and "main" or "master"
			end

			-- Opens the diff for unstaged changes
			vim.keymap.set("n", "<leader>gd", "<CMD>DiffviewOpen<CR>", { desc = "[G]it [D]iff", silent = true })

			-- Opens the diff for all changes relative to main/master branch
			vim.keymap.set("n", "<leader>gm", function()
				vim.cmd("DiffviewOpen " .. get_default_branch_name())
			end, { desc = "[G]it Diff [M]aster", silent = true })

			-- Opens the diff for all changes for each commit up to the current branch
			vim.keymap.set(
				"n",
				"<leader>gf",
				"<CMD>DiffviewFileHistory<CR>",
				{ desc = "[G]it [F]ile History", silent = true }
			)

			-- Opens the diff for all changes in the current file only
			-- Note: `--follow` tells git to follow the file across renames
			vim.keymap.set(
				"n",
				"<leader>gF",
				"<CMD>DiffviewFileHistory --follow %<CR>",
				{ desc = "[G]it Current [F]ile History", silent = true }
			)

			-- Opens the diff for the current visual selection
			vim.keymap.set(
				"v",
				"<leader>gl",
				"<ESC><CMD>'<,'>DiffviewFileHistory --follow<CR>",
				{ desc = "[G]it Diff Lines", silent = true }
			)
		end,
	},
}
