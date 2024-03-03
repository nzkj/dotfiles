-- Show substitutions even if off-screen
vim.opt.inccommand = 'split'

-- Hide current mode in command line as it's shown using status line
vim.opt.showmode = false

-- Make line numbers default
vim.wo.number = true

-- Set current cursor line highlight
vim.o.cursorline = true

-- Tab settings
vim.o.tabstop = 4
vim.o.shiftwidth = 4

-- Enable mouse mode
vim.o.mouse = 'a'

-- Sync clipboard between OS and Neovim.
vim.o.clipboard = 'unnamedplus'

-- Enable break indent
vim.o.breakindent = true

-- Save undo history
vim.o.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Change new splits to open right/bottom
vim.o.splitright = true
vim.o.splitbelow = true

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeout = true
vim.o.timeoutlen = 300

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'

-- NOTE: You should make sure your terminal supports this
vim.o.termguicolors = true

-- Enable relative line numbers
vim.o.relativenumber = true

-- Enable GitHub copilot tab completion
vim.g.copilot_assume_mapped = true

-- Enable spell checking
vim.o.spell = true
vim.o.spelloptions = 'camel'

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

---------------------
-- General Keymaps --
---------------------

-- Switch between buffers
-- vim.api.nvim_set_keymap("n", "<TAB>", "<C-^>", { noremap = true, silent = true, desc = "Alternate buffers" })
-- vim.api.nvim_set_keymap("n", "<Tab>", ":bnext<cr>", { noremap = true })
-- vim.api.nvim_set_keymap("n", "<S-Tab>", ":bprevious<cr>", { noremap = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Make macros easier to invoke
vim.keymap.set('n', 'Q', '@qj')
vim.keymap.set('x', 'Q', ':norm @q<CR>') -- Run macro on each line of visual selection

-- Toggle relative line numbers (helpful when sharing screen)
function ToggleRelativeLineNumbers()
    if vim.o.relativenumber then
        vim.wo.relativenumber = false
    else
        vim.wo.relativenumber = true
    end
end

vim.keymap.set('n', '<leader>tr', ':lua ToggleRelativeLineNumbers()<CR>',
    { desc = '[T]oggle [R]elative line numbers', silent = true })

-- Switch between splits using Ctrl + arrow keys
vim.api.nvim_set_keymap('n', '<C-Up>', '<C-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Down>', '<C-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Left>', '<C-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-Right>', '<C-w>l', { noremap = true, silent = true })
