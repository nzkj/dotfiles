return {
	-- Copilot autocompletion, disabled by default
	"github/copilot.vim",
	config = function()
		vim.g.copilot_enabled = false
		vim.g.copilot_assume_mapped = true
		vim.g.copilot_no_tab_map = true

		vim.keymap.set("i", "<C-j>", 'copilot#Accept("<CR>")', { expr = true, replace_keycodes = false, silent = true })
		vim.keymap.set("n", "<leader>ta", function()
			vim.g.copilot_enabled = not vim.g.copilot_enabled
			if vim.g.copilot_enabled then
				vim.cmd("Copilot enable")
				print("Copilot enabled!")
			else
				vim.cmd("Copilot disable")
				print("Copilot disabled!")
			end
		end, { desc = "[T]oggle [A]I" })
	end,
}
