-- Author: Keegan James
-- Date: Nov 7th 2022

-- Set <space> as the leader key
-- NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Install package manager "Lazy"
local lazypath = vim.fn.stdpath 'data' .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system {
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable',
        lazypath,
    }
end
vim.opt.rtp:prepend(lazypath)

-- Load basic vim options
require("options")

-- Install all my plugins:
-- Plugins are defined under the directory `lua/plugins`.
-- Each Lua module (my-plugin.lua) returns a Lua table that defines the plugin to be installed.
-- We don't need to use `require('my-plugin').setup()` in this file as Lazy calls it by default IF
-- the `config` function is defined in the Lua module.
-- Note: We require "options" above because it isn't a Lua module, but just a Lua script.
-- For more info, see:
-- `https://github.com/folke/lazy.nvim?tab=readme-ov-file#-structuring-your-plugins`.
require('lazy').setup("plugins", {
    change_detection = {
        notify = false
    }
})
