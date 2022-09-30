-- general
lvim.log.level = "warn"
lvim.format_on_save = true
lvim.colorscheme = "tokyonight"
-- to disable icons and use a minimalist setup, uncomment the following
-- lvim.use_icons = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
local options = { noremap = true }
local keymap = vim.api.nvim_set_keymap
-- local g = vim.g
-- local fn = vim.fn

keymap("c", "jj", "<C-C>", options)
keymap("i", "jj", "<ESC>", options)
keymap("i", "jl", "<Right>", options)
keymap("i", "jh", "<Left>", options)
keymap("n", "<C-s>", ":w<CR>", options)
keymap("i", "<C-s>", "<ESC>:w<CR>", options)
keymap("v", "<C-s>", "<ESC>:w<CR>", options)

-- Map commentary
keymap("v", "<C-_>", "gc", {})
keymap("n", "<C-_>", "gcc", {})
keymap("i", "<C-_>", "<Esc>VgcA", {})

keymap(
  "n",
  "<C-p>",
  '<cmd>lua require("telescope.builtin").find_files({ hidden=true, no_ignore=true })<CR>',
  options
)

-- unmap a default keymapping
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.builtin.telescope.defaults = {
  sorting_strategy = "ascending",
  layout_config = {
    horizontal = {
      prompt_position = "top"
    }
  },
  file_ignore_patterns = { "node_modules", "^.git/" },
}

lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.open_mapping = "<F12>"
-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope grep_string <CR>", "Find text" }
lvim.builtin.which_key.mappings["F"] = { "<cmd>Telescope grep_string <CR>", "Find current word" }
lvim.builtin.which_key.mappings["p"] = { require("lvim.core.telescope.custom-finders").find_project_files, "Find File" }
lvim.builtin.which_key.mappings["P"] = {
  name = "Packer",
  c = { "<cmd>PackerCompile<cr>", "Compile" },
  i = { "<cmd>PackerInstall<cr>", "Install" },
  r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
  s = { "<cmd>PackerSync<cr>", "Sync" },
  S = { "<cmd>PackerStatus<cr>", "Status" },
  u = { "<cmd>PackerUpdate<cr>", "Update" },

}

-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
lvim.builtin.notify.active = true
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "bash",
  "c",
  "go",
  "javascript",
  "json",
  "lua",
  "python",
  "typescript",
  "tsx",
  "css",
  "rust",
  "java",
  "yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "gofumpt", arg = "-extra", filetypes = { "go" } },
  { command = "goimports", filetypes = { "go" } },
}


-- Additional Plugins
lvim.plugins = {
  { "ghifarit53/tokyonight-vim" },
}

