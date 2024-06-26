return {
  "nvimdev/lspsaga.nvim",
  config = function()
    local sg = require("lspsaga")

    sg.setup({
      ui = {
        code_action = "💡",
      },

      code_action = {
        keys = {
          quit = "<ESC>",
        },
      },

      finder = {
        keys = {
          toggle_or_open = "<CR>",
          quit = "<ESC>",
        },
      },

      rename = {
        keys = {
          quit = "<ESC>",
        },
      },

      lightbulb = {
        enable = true,
        sign = false,
        -- sign_priority = 20,
        virtual_text = true,
      },
    })
  end,
}
