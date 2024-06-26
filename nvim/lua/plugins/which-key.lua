return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  config = function()
    local wk = require("which-key")
    wk.register({
      o = {
        name = "Go Tool", -- optional group name
        s = { "<cmd>GoTestFunc -s<CR>", "Go Test Func Select" },
        t = { "<cmd>GoTestFunc<CR>", "Go Test Func" },
        T = { "<cmd>GoTestFunc -F<CR>", "Go Test Func Floaterm" },
        f = { "<cmd>GoFillStruct<CR>", "Go Fill Struct" },
        e = { "<cmd>GoIfErr<CR>", "Go If Err" },
      },
    }, { prefix = "g" })
  end,
}
