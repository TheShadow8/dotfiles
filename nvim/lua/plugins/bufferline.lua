return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  version = "*",
  opts = {
   options = {
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            return "(" .. count .. ")"
        end,
        offsets = {{filetype = "NvimTree", text = "File Explorer", text_align = "center"}},
        separator_style = "thin"
        -- enforce_regular_tabs = true,
  },
}}