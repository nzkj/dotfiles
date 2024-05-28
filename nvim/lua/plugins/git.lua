return {
  -- Git commands in Neovim
  { 'tpope/vim-fugitive' },
  { 'tpope/vim-rhubarb' },

  -- GitHub AI completion
  { 'github/copilot.vim' },

  -- Adds git related signs to the gutter, as well as utilities for managing changes
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      signs = {
        add = { text = '+' },
        change = { text = '~' },
        delete = { text = '_' },
        topdelete = { text = '‾' },
        changedelete = { text = '~' },
      },
      on_attach = function(bufnr)
        vim.keymap.set('n', '<leader>gp', require('gitsigns').prev_hunk,
          { buffer = bufnr, desc = '[G]it Previous Hunk' })
        vim.keymap.set('n', '<leader>gn', require('gitsigns').next_hunk,
          { buffer = bufnr, desc = '[G]it Next Hunk' })
        vim.keymap.set('n', '<leader>gv', require('gitsigns').preview_hunk,
          { buffer = bufnr, desc = '[G]it [V]iew Hunk' })
        vim.keymap.set('n', '<leader>gb', require('gitsigns').toggle_current_line_blame,
          { buffer = bufnr, desc = '[G]it Toggle [B]lame' })
      end,
    },
  },
}
