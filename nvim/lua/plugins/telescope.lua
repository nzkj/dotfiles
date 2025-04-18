return {
  -- Fuzzy Finder (files, grep, LSP, etc.)
  {
    'nvim-telescope/telescope.nvim',
    event = 'VimEnter',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      'nvim-telescope/telescope-live-grep-args.nvim',
      'nvim-telescope/telescope-file-browser.nvim',
      {
        'nvim-telescope/telescope-fzf-native.nvim',
        -- `build` is used to run some command when the plugin is installed/updated.
        -- This is only run then, not every time Neovim starts up.
        build = 'make',
        cond = function()
          if vim.fn.executable 'make' == 0 then
            print('WARNING: telescope-fzf-native.nvim: make is not installed')
          end
          return vim.fn.executable 'make' == 1
        end,
      },
    },
    config = function()
      -- Focus on preview window for pickers
      local focus_preview_keymap = "<Tab>"
      local focus_preview = function(prompt_bufnr)
        local picker = require("telescope.actions.state").get_current_picker(prompt_bufnr)

        if not picker:get_selection() then
          print("No entry selected, cannot focus preview")
          return
        end
        if not picker.previewer then
          print("No previewer available, cannot focus preview")
          return
        end

        -- Set keymap to switch back to prompt window
        vim.keymap.set("n", focus_preview_keymap, function()
          vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", picker.prompt_win))
        end, { buffer = picker.previewer.state.bufnr })

        -- Set keymap to exit focus mode
        vim.keymap.set("n", "<ESC>", function()
          vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", picker.prompt_win))
          vim.cmd("stopinsert")
        end, { buffer = picker.previewer.state.bufnr })

        -- Focus on preview window
        vim.cmd(string.format("noautocmd lua vim.api.nvim_set_current_win(%s)", picker.previewer.state.winid))
      end

      local actions = require "telescope.actions"
      local action_layout = require("telescope.actions.layout")
      local lga_actions = require("telescope-live-grep-args.actions")
      require('telescope').setup {
        defaults = {
          -- Output format of grep
          vimgrep_arguments = {
            -- Defaults
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            -- Remove whitespace from results
            "--trim"
          },
          layout_strategy = "vertical",
          path_display = { "filename_first" },
          mappings = {
            n = {
              ["<M-p>"] = action_layout.toggle_preview
            },
            i = {
              ["<M-p>"] = action_layout.toggle_preview,
              ["<C-d>"] = actions.delete_buffer + actions.move_to_top,
              ["<C-f>"] = actions.to_fuzzy_refine,
              [focus_preview_keymap] = focus_preview,
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
              n = {
                -- Press <CR> to checkout the commit (default)
                -- Press <ESC><CR> to open the commit in Diffview
                ["<CR>"] = function(prompt_bufnr)
                  local commit_hash = require("telescope.actions.state").get_selected_entry()
                  require("telescope.actions").close(prompt_bufnr)
                  vim.cmd('DiffviewOpen ' .. commit_hash.value)
                end,
              }
            }
          },
        },
        extensions = {
          live_grep_args = {
            mappings = {
              i = {
                ["<C-d>"] = false, -- Disable delete buffer to prevent error
                ["<C-f>"] = lga_actions.to_fuzzy_refine,
                ["<C-k>"] = lga_actions.quote_prompt(),
                ["C-g"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
              },
            },
          },
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
      pcall(require("telescope").load_extension, "live_grep_args")
      pcall(require("telescope").load_extension, "neoclip")
      pcall(require("telescope").load_extension, "file_browser")

      local builtin = require('telescope.builtin')
      local lga_shortcuts = require("telescope-live-grep-args.shortcuts")

      -- Basic keymaps
      vim.keymap.set('n', '<leader><space>', builtin.buffers, { desc = '[ ] Open buffers' })
      vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
      vim.keymap.set('n', '<leader>sd', builtin.diagnostics, { desc = '[S]earch [D]iagnostics' })
      vim.keymap.set('n', '<leader>sH', builtin.help_tags, { desc = '[S]earch [H]elp' })
      vim.keymap.set('n', '<leader>sj', builtin.jumplist, { desc = '[S]earch [J]umplist' })
      vim.keymap.set('n', '<leader>s.', builtin.oldfiles, { desc = '[S]earch [.] Recent Files' })
      vim.keymap.set('n', '<leader>sr', builtin.resume, { desc = '[S]earch [R]esume' })
      vim.keymap.set('n', '<leader>sb', builtin.current_buffer_fuzzy_find, { desc = '[S]earch [B]uffer' })

      -- LSP keymaps
      vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = '[G]oto [R]eferences' })
      vim.keymap.set('n', 'gO', builtin.lsp_document_symbols, { desc = 'Open Document Symbols' })
      vim.keymap.set('n', 'gW', builtin.lsp_dynamic_workspace_symbols, { desc = 'Open Workspace Symbols' })

      -- Git keymaps
      vim.keymap.set('n', '<leader>gc', builtin.git_commits, { desc = '[G]it [C]ommits' })

      -- Grep keymaps
      vim.keymap.set("n", "<leader>sw", lga_shortcuts.grep_word_under_cursor, { desc = '[S]earch [W]ord' })
      vim.keymap.set("v", "<leader>sw", lga_shortcuts.grep_visual_selection,
        { desc = '[S]earch  [W]ords' }) -- Only works in visual mode, not visual line
      vim.keymap.set("n", "<leader>sg", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>",
        { desc = '[S]earch [G]rep', silent = true })
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
