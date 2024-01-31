-- Other modules that require theme change:
--  lualine.lua
-- Retro colorscheme
return {
  'ellisonleao/gruvbox.nvim',
  priority = 1000,
  config = function()
    vim.cmd.colorscheme 'gruvbox'
  end,
}
