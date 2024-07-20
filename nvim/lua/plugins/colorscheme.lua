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
    vim.cmd('highlight WhichKeyNormal guifg=#473c29')
    vim.cmd('highlight WhichKeyTitle guifg=#fabd2f')
  end,
}

-- return {
--   'rebelot/kanagawa.nvim',
--   priority = 1000,
--   config = function()
--     require('kanagawa').setup({
--       theme = 'dragon',
--       colors = {
--         theme = {
--           all = {
--             ui = {
--               bg_gutter = "none"
--             }
--           }
--         }
--       }
--     })
--     vim.cmd('colorscheme kanagawa-dragon')
--   end,
-- }

-- return {
--   'navarasu/onedark.nvim',
--   priority = 1000,
--   config = function()
--     require('onedark').setup {
--       style = 'warmer',
--     }
--     require('onedark').load()
--   end,
-- }
