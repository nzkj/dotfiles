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
    vim.cmd('highlight CursorLineNr guifg=#fabd2f ctermfg=yellow')
  end,
}
