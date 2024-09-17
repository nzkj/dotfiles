return {
  -- Fuzzy Finder (files, lsp, etc)
  {
    'nvim-telescope/telescope.nvim',
    -- Comment line below to get rolling release
    -- branch = '0.1.x',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-live-grep-args.nvim',
    },
    config = function()
      -- Call setup function with specific (non-default) settings
      local actions = require "telescope.actions"
      local action_layout = require("telescope.actions.layout")
      require('telescope').setup {
        defaults = {
          -- Adjust output of grep, like removing white space with `--trim`
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim"
          },
          layout_strategy = "vertical",
          path_display = {
            "filename_first",
          },
          mappings = {
            n = {
              ["<M-p>"] = action_layout.toggle_preview
            },
            i = {
              ["<M-p>"] = action_layout.toggle_preview,
              ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
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
          git_commits = {
            mappings = {
              -- Note:
              -- Press <CR> to checkout the commit
              -- Press <ESC><CR> to open the commit in Diffview
              n = {
                ["<CR>"] = function(prompt_bufnr)
                  -- Get the selected commit hash
                  local entry = require("telescope.actions.state").get_selected_entry()

                  -- Close telescope
                  require("telescope.actions").close(prompt_bufnr)

                  -- Open diffview
                  vim.cmd('DiffviewOpen ' .. entry.value)
                end,
              }
            }
          },
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
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })

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
