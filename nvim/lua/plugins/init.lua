return {
  -- Git
  "tpope/vim-fugitive",
  -- General
  "tpope/vim-dispatch",
  "tpope/vim-commentary",
  "tpope/vim-surround",
  "Yggdroot/indentLine",
  "Valloric/MatchTagAlways",
  -- Theme / Interface
  { "styled-components/vim-styled-components", branch = "main" },
  "morhetz/gruvbox",
  "mhartington/oceanic-next",
  { "dracula/vim", as = "dracula" },
  "ayu-theme/ayu-vim",
  "joshdick/onedark.vim",
  "tomasiser/vim-code-dark",
  {
    "ghifarit53/tokyonight-vim",
    config = function()
      local cmd = vim.cmd
      cmd("colorscheme tokyonight")
    end,
  },
  "APZelos/blamer.nvim",
  "lifepillar/vim-gruvbox8",
  "sainnhe/sonokai",
  -- Session
  "mhinz/vim-startify",
  "tpope/vim-obsession",
  -- "alvan/vim-closetag",
  "voldikss/vim-floaterm",
}
