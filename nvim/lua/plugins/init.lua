-- vim.cmd 'packadd paq-nvim'            -- load package

require "paq" {
    -- Git
    "tpope/vim-fugitive",
    "airblade/vim-gitgutter",
    -- General
    "tpope/vim-dispatch",
    "tpope/vim-commentary",
    "tpope/vim-surround",
    "Yggdroot/indentLine",
    "andymass/vim-matchup",
    -- Theme / Interface
    {"styled-components/vim-styled-components", branch = "main"},
    "morhetz/gruvbox",
    "mhartington/oceanic-next",
    {"dracula/vim", as = "dracula"},
    "ayu-theme/ayu-vim",
    "joshdick/onedark.vim",
    "tomasiser/vim-code-dark",
    "ghifarit53/tokyonight-vim",
    "lifepillar/vim-gruvbox8",
    "sainnhe/sonokai",
    -- Session
    "mhinz/vim-startify",
    "tpope/vim-obsession",
    -- "alvan/vim-closetag",
    "voldikss/vim-floaterm",
    ------ NVIM
    "savq/paq-nvim",
    "APZelos/blamer.nvim",
    "hoob3rt/lualine.nvim",
    "kyazdani42/nvim-tree.lua",
    "akinsho/bufferline.nvim",
    "windwp/nvim-autopairs",
    "neovim/nvim-lspconfig",
    "kabouzeid/nvim-lspinstall",
    "glepnir/lspsaga.nvim",
    "folke/lsp-colors.nvim",
    -- For auto completion
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-vsnip",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-path",
    "rafamadriz/friendly-snippets",
    "onsails/lspkind-nvim",
    --
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
    "JoosepAlviste/nvim-ts-context-commentstring",
    "windwp/nvim-ts-autotag",
    "kyazdani42/nvim-web-devicons",
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
}

require("plugins/web-devicons")
require("plugins/autopairs")
require("plugins/lsp-kind")
require("plugins/nvim-tree")
require("plugins/bufferline")
require("plugins/cmp")
require("plugins/formatter")
require("plugins/treesitter")
require("plugins/lualine")
require("plugins/telescope")
