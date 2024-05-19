-- Other modules that require theme change:
--  lualine.lua
return {
  'sainnhe/gruvbox-material',
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_background = 'hard'
    vim.g.gruvbox_material_foreground = 'original'
    vim.g.gruvbox_material_better_performance = 1
    vim.cmd.colorscheme 'gruvbox-material'
    vim.cmd('highlight CursorLineNr guifg=#fabd2f')
    vim.cmd('highlight WhichKeyFloat guifg=#1D2021')
    vim.cmd('highlight WhichKeyBorder guifg=#473c29')
  end,
}
