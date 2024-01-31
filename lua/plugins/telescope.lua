return {
  {
    -- Fuzzy Finder (files, lsp, etc)
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nvim-tree/nvim-web-devicons',
    },
    config = function()
      -- Call setup function with specific (non-default) settings
      require('telescope').setup {
        defaults = {
          layout_strategy = "vertical",
          mappings = {
            i = {
              ['<C-u>'] = false,
              ['<c-d>'] = "delete_buffer",
            },
          },
          file_ignore_patterns = {
            "build"
          }
        },
        extensions = {
          file_browser = {
            git_status = false,
            grouped = true,
            layout_strategy = "horizontal",
            sorting_strategy = "ascending",
            layout_config = {
              prompt_position = "top",
            },
          },
        },
      }
      pcall(require('telescope').load_extension, 'fzf')
      pcall(require("telescope").load_extension("live_grep_args"))
      pcall(require("telescope").load_extension("neoclip"))
      pcall(require("telescope").load_extension("file_browser"))

      -- Basic keymaps
      vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sb', require('telescope.builtin').current_buffer_fuzzy_find,
        { desc = '[S]earch [B]uffer' })
      vim.keymap.set('n', '<leader>sr', require('telescope.builtin').resume, { desc = '[S]earch [R]esume' })

      -- Grep keymaps
      vim.keymap.set("n", "<leader>sw", require("telescope-live-grep-args.shortcuts").grep_word_under_cursor,
        { desc = '[S]earch current [W]ord' })
      vim.keymap.set("v", "<leader>sw", require("telescope-live-grep-args.shortcuts").grep_visual_selection,
        { desc = '[S]earch current [W]ords' }) -- Only works in visual mode, not visual line
      vim.keymap.set("n", "<leader>sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        { desc = '[S]earch by [G]rep' })

      -- Neoclip keymaps
      vim.keymap.set('n', '<leader>sc', ':Telescope neoclip<CR>',
        { desc = '[S]earch [C]lipboard' })

      -- Explorer keymaps
      vim.keymap.set('n', '<leader>e', ":Telescope file_browser<CR>", { desc = '[E]xplore root directory' })
      vim.keymap.set('n', '<leader>E', ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { desc = '[E]xplore current directory' })
    end,
  },

  -- Fuzzy finder algorithm
  {
    'nvim-telescope/telescope-fzf-native.nvim',
    -- NOTE: If you are having trouble with this installation,
    --       refer to the README for telescope-fzf-native for more instructions.
    build = 'make',
    cond = function()
      return vim.fn.executable 'make' == 1
    end,
  },

  -- File browser
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" },
  },

  -- Save clipboard history
  {
    "AckslD/nvim-neoclip.lua",
    requires = {
      { 'nvim-telescope/telescope.nvim' },
    },
    config = function()
      require('neoclip').setup({
        on_paste = {
          close_telescope = false
        },
      })
    end,
  },
}
