return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")
    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "ayu_mirage",
        section_separators = { "", "" },
        component_separators = { "", "" },
        disabled_filetypes = {},
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = {
          "branch",
          -- "b:gitsigns_status",
          {
            "diff",
            color_added = "#00D000",
            color_modified = "#EBEB00",
            color_removed = "#ff2222",
          },
          -- getStatusCount
        },
        lualine_c = { "filename" },
        lualine_x = {
          {
            "diagnostics",
            sources = { "nvim_lsp" },
            symbols = { error = " ", warn = " ", info = " ", hint = " " },
          },
          "encoding",
          "filetype",
        },
        lualine_y = { "progress" },
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      extensions = { "fugitive" },
    })
  end,
}

