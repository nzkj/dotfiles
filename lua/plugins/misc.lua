-- Miscellaneous plugins
return {
    -- Detect tabstop and shiftwidth automatically
    { 'tpope/vim-sleuth' },

    -- Enable editing surroundings
    { 'tpope/vim-surround' },

    -- Useful plugin to show you pending keybinds
    { 'folke/which-key.nvim', opts = {} },

    -- Add indentation guides even on blank lines
    {
        'lukas-reineke/indent-blankline.nvim',
        opts = {
            char = '┊',
            show_trailing_blankline_indent = false,
        },
    },

    -- "gc" to comment visual regions/lines
    { 'numToStr/Comment.nvim', opts = {} },
}
