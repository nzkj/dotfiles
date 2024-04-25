return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-live-grep-args.nvim',
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
          -- Ignore build files (e.g. for C++ projects)
          file_ignore_patterns = {
            "build"
          }
        },
        pickers = {
          lsp_references = { fname_width = 50 },
          lsp_document_symbols = { symbol_width = 50 },
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
      local builtin = require 'telescope.builtin'
      vim.keymap.set('n', '<leader>?', builtin.oldfiles, { desc = '[?] Find recently opened files' })
      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Find existing buffers' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sH', builtin.help_tags, { desc = '[S]earch [H]elp!' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find,
        { desc = '[S]earch [B]uffer' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>sj', builtin.jumplist, { desc = '[S]earch [J]umplist' })

      -- LSP keymaps
      vim.keymap.set('n', 'gr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })
      vim.keymap.set('n', '<leader>ss', builtin.lsp_document_symbols,
        { desc = '[S]earch [S]ymbols' })

      -- Git keymaps
      vim.keymap.set('n', '<leader>gf', builtin.git_files, { desc = 'Search [G]it [F]iles' })
      vim.keymap.set('n', '<leader>gs', builtin.git_status, { desc = 'Search [G]it [S]tatus' })

      -- Grep keymaps
      vim.keymap.set("n", "<leader>sw", require("telescope-live-grep-args.shortcuts").grep_word_under_cursor,
        { desc = '[S]earch current [W]ord' })
      vim.keymap.set("v", "<leader>sw", require("telescope-live-grep-args.shortcuts").grep_visual_selection,
        { desc = '[S]earch current [W]ords' }) -- Only works in visual mode, not visual line
      vim.keymap.set("n", "<leader>sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        { desc = '[S]earch by [G]rep', silent = true })
      vim.keymap.set('n', '<leader>s/', function()
        builtin.live_grep {
          grep_open_files = true,
          prompt_title = 'Live Grep in Open Files',
        }
      end, { desc = '[S]earch [/] in Open Files' })

      -- Neoclip keymaps
      vim.keymap.set('n', '<leader>sc', ':Telescope neoclip<CR>',
        { desc = '[S]earch [C]lipboard', silent = true })

      -- Explorer keymaps
      vim.keymap.set('n', '<leader>e', ":Telescope file_browser<CR>",
        { desc = '[E]xplore root directory', silent = true })
      vim.keymap.set('n', '<leader>E', ":Telescope file_browser path=%:p:h select_buffer=true<CR>",
        { desc = '[E]xplore current directory', silent = true })
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
