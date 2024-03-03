local header_art = {
  [[                                                                                                                          ]],
  [[                                                                                                                          ]],
  [[                                                                                                                          ]],
  [[  /$$$$$$$$ /$$   /$$ /$$$$$$$$       /$$      /$$  /$$$$$$  /$$$$$$$  /$$   /$$  /$$$$$$  /$$   /$$  /$$$$$$  /$$$$$$$   ]],
  [[ |__  $$__/| $$  | $$| $$_____/      | $$  /$ | $$ /$$__  $$| $$__  $$| $$  /$$/ /$$__  $$| $$  | $$ /$$__  $$| $$__  $$  ]],
  [[    | $$   | $$  | $$| $$            | $$ /$$$| $$| $$  \ $$| $$  \ $$| $$ /$$/ | $$  \__/| $$  | $$| $$  \ $$| $$  \ $$  ]],
  [[    | $$   | $$$$$$$$| $$$$$         | $$/$$ $$ $$| $$  | $$| $$$$$$$/| $$$$$/  |  $$$$$$ | $$$$$$$$| $$  | $$| $$$$$$$/  ]],
  [[    | $$   | $$__  $$| $$__/         | $$$$_  $$$$| $$  | $$| $$__  $$| $$  $$   \____  $$| $$__  $$| $$  | $$| $$____/   ]],
  [[    | $$   | $$  | $$| $$            | $$$/ \  $$$| $$  | $$| $$  \ $$| $$\  $$  /$$  \ $$| $$  | $$| $$  | $$| $$        ]],
  [[    | $$   | $$  | $$| $$$$$$$$      | $$/   \  $$|  $$$$$$/| $$  | $$| $$ \  $$|  $$$$$$/| $$  | $$|  $$$$$$/| $$        ]],
  [[    |__/   |__/  |__/|________/      |__/     \__/ \______/ |__/  |__/|__/  \__/ \______/ |__/  |__/ \______/ |__/        ]],
  [[                                                                                                                          ]],
  [[                                                                                                                          ]],
}

return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
    "nvim-lua/plenary.nvim"
  },

  config = function()
    local alpha_th = require("alpha.themes.theta")
    local alpha_db = require("alpha.themes.dashboard")

    alpha_th.header.val = header_art

    alpha_th.buttons.val = {
      { type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "center" } },
      alpha_db.button("e", "    New file", ":ene <BAR> startinsert <CR>"),
      alpha_db.button("<leader> sf", "    Search file"),
      alpha_db.button("<leader> sg", "󰾹    Search grep"),
      alpha_db.button("<leader>  e", "󱎸    Explorer"),
      alpha_db.button("o", "󰏇    Oil", ":Oil<CR>"),
      alpha_db.button("c", "    Configuration", ":e $MYVIMRC <CR>"),
      alpha_db.button("q", "    Quit", ":qa<CR>"),
    }

    require "alpha".setup(alpha_th.config)
  end
}
