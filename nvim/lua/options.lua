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
-- Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
    vim.opt.clipboard = 'unnamedplus'
end)


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
vim.g.copilot_no_tab_map = true
vim.keymap.set('i', '<C-y>', 'copilot#Accept("\\<CR>")', { expr = true, replace_keycodes = false })

-- Enable spell checking
vim.o.spell = true
vim.o.spelloptions = 'camel'

-- Automatic indenting when pressing enter
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Disable swap files
vim.opt.swapfile = false

-- Highlight on yank
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})

-- Don't auto comment new lines after o and O
vim.cmd([[autocmd FileType * set formatoptions-=cro]])

-------------------
-- Auto Commands --
-------------------

vim.api.nvim_create_autocmd('BufReadPost', {
    desc = 'Open file at the last position it was edited earlier',
    group = misc_augroup,
    pattern = '*',
    command = 'silent! normal! g`"zv'
})

-- Open help window in a vertical split to the right.
vim.api.nvim_create_autocmd("BufWinEnter", {
    group = vim.api.nvim_create_augroup("help_window_right", {}),
    pattern = { "*.txt" },
    callback = function()
        if vim.o.filetype == 'help' then vim.cmd.wincmd("L") end
    end
})

---------------------
-- General Keymaps --
---------------------

-- Remaps for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })
vim.keymap.set('n', '<Up>', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', '<Down>', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

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

-- Close tab
vim.keymap.set('n', '<leader>tc', ':tabclose<CR>', { desc = '[T]ab [C]lose', silent = true })

-- Switch between splits using Ctrl + arrow keys
vim.keymap.set('n', '<C-Up>', '<C-w>k', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Down>', '<C-w>j', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Left>', '<C-w>h', { noremap = true, silent = true })
vim.keymap.set('n', '<C-Right>', '<C-w>l', { noremap = true, silent = true })

-- Resize splits using Alt + arrow keys
-- Split resizing is slightly confusing. It is not based on split location!
-- Left = "Make thinner", Right = "Make wider", Up = "Make taller", Down = "Make shorter"
vim.keymap.set("n", "<M-Left>", "<c-w>5<", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Right>", "<c-w>5>", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Up>", "<c-w>5+", { noremap = true, silent = true })
vim.keymap.set("n", "<M-Down>", "<c-w>5-", { noremap = true, silent = true })

-- Stay in indent mode when changing indentation
vim.keymap.set("v", "<", "<gv", { noremap = true, silent = true })
vim.keymap.set("v", ">", ">gv", { noremap = true, silent = true })

-- Quickfix list navigation
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")

-- Open Oil file explorer (C-c to close)
vim.keymap.set("n", "<leader>o", "<cmd>Oil<CR>", { desc = '[O]il', silent = true })
