-- vim.cmd 'packadd paq-nvim'            -- load package

require "paq" {
    -- Git
    "tpope/vim-fugitive",
    "airblade/vim-gitgutter",
    -- General
    -- Plug 'junegunn/fzf'
    -- Plug 'junegunn/fzf.vim'
    -- Plug 'preservim/nerdtree' |
    --        \ Plug 'Xuyuanp/nerdtree-git-plugin'
    "tiagofumo/vim-nerdtree-syntax-highlight",
    "tpope/vim-dispatch",
    "tpope/vim-commentary",
    "tpope/vim-surround",
    {"mg979/vim-visual-multi", branch = "master"},
    "Raimondi/delimitMate",
    "Yggdroot/indentLine",
    -- Theme / Interface
    "ap/vim-buftabline",
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
    "alvan/vim-closetag",
    "voldikss/vim-floaterm",
    ------ NVIM
    "savq/paq-nvim",
    "APZelos/blamer.nvim",
    "hoob3rt/lualine.nvim",
    "kristijanhusak/defx-git",
    "kristijanhusak/defx-icons",
    -- {"Shougo/defx.nvim",  run="UpdateRemotePlugins" };
    "neovim/nvim-lspconfig",
    "kabouzeid/nvim-lspinstall",
    "glepnir/lspsaga.nvim",
    "folke/lsp-colors.nvim",
    "hrsh7th/nvim-compe",
    "hrsh7th/vim-vsnip",
    "rafamadriz/friendly-snippets",
    "mhartington/formatter.nvim",
    {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"},
    "JoosepAlviste/nvim-ts-context-commentstring",
    "kyazdani42/nvim-web-devicons",
    --Plug 'windwp/nvim-autopairs'
    "nvim-lua/popup.nvim",
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
}

require("plugins/completion")
require("plugins/formatter")
require("plugins/treesitter")
require("plugins/web-devicons")
require("plugins/lualine")
require("plugins/telescope")
