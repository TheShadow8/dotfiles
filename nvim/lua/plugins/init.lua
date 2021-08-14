-- vim.cmd 'packadd paq-nvim'            -- load package

require "paq" {
   "savq/paq-nvim"; 
   "APZelos/blamer.nvim";
   "hoob3rt/lualine.nvim";
   "kristijanhusak/defx-git";
   "kristijanhusak/defx-icons";
   -- {"Shougo/defx.nvim",  run="UpdateRemotePlugins" };
   "neovim/nvim-lspconfig";
   "kabouzeid/nvim-lspinstall";
   "glepnir/lspsaga.nvim";
   "folke/lsp-colors.nvim";
   "hrsh7th/nvim-compe";
   "hrsh7th/vim-vsnip";
   "rafamadriz/friendly-snippets";
   "mhartington/formatter.nvim";
  {"nvim-treesitter/nvim-treesitter", run=":TSUpdate" };
   "JoosepAlviste/nvim-ts-context-commentstring";
   "kyazdani42/nvim-web-devicons";
  --Plug 'windwp/nvim-autopairs'
  "nvim-lua/popup.nvim";
  "nvim-lua/plenary.nvim";
  "nvim-telescope/telescope.nvim";
  
}

require ("plugins/completion")
require ("plugins/formatter")
require ("plugins/treesitter")
require("plugins/web-devicons")
require("plugins/lualine")
require("plugins/telescope")
