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

      vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end,
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
  }
}
