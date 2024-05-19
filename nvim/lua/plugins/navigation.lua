return {
  -- Make navigation easier by adding files to hot keys
  -- The keymaps below are largely based on the Colemak-DHm layout
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()

      vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end,
        { desc = "Harpoon [A]ppend", silent = true, noremap = true })
      vim.keymap.set("n", "<leader>sh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end,
        { desc = "[S]earch [H]arpoon", silent = true, noremap = true })

      vim.keymap.set("n", "<C-t>", function() harpoon:list():select(1) end, { silent = true, noremap = true })
      vim.keymap.set("n", "<C-s>", function() harpoon:list():select(2) end, { silent = true, noremap = true })
      vim.keymap.set("n", "<C-r>", function() harpoon:list():select(3) end, { silent = true, noremap = true })
      vim.keymap.set("n", "<C-a>", function() harpoon:list():select(4) end, { silent = true, noremap = true })

      -- Rebind keymaps that were overwritten above
      -- I should rebind <C-t> to something else, but I don't really use tag stack navigation
      vim.keymap.set("n", "U", "<C-r>", { silent = true, noremap = true })
      vim.keymap.set("n", "<C-q>", "<C-a>", { silent = true, noremap = true })
      vim.keymap.set("v", "<C-q>", "<C-a>", { silent = true, noremap = true })
      vim.keymap.set("v", "g<C-q>", "g<C-a>", { silent = true, noremap = true })
      vim.keymap.set("x", "<C-q>", "<C-a>", { silent = true, noremap = true })
      vim.keymap.set("x", "g<C-q>", "g<C-a>", { silent = true, noremap = true })
    end
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {
      -- Prioritise Colemak keys
      labels = "arstneiogmqwfpbjluyzxcdvkh",
      modes = {
        treesitter = {
          labels = "arstneiogmqwfpbjluyzxcdvkh",
        },
        -- Disable f,F,t,T,; and , for now
        char = {
          enabled = false,
        },
        search = {
          -- Remove accidental jumping when searching for text you don't know doesn't exist
          enabled = false,
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
      { "S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
      { "r", mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
      { "R", mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
    },
  }
}
