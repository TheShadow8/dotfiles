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
vim.opt.timeoutlen = 200

keymap("c", "jj", "<C-C>", options)
keymap("i", "jj", "<ESC>", options)
keymap("i", "jl", "<Right>", options)
keymap("i", "jh", "<Left>", options)
keymap("n", "<C-s>", ":w<CR>", options)
keymap("i", "<C-s>", "<ESC>:w<CR>", options)
keymap("v", "<C-s>", "<ESC>:w<CR>", options)

keymap("t", "<esc>", [[<C-\><C-n>]], options)
keymap("t", "jk", [[<C-\><C-n>]], options)
keymap("t", "<C-h>", [[<Cmd>wincmd h<CR>]], options)
keymap("t", "<C-j>", [[<Cmd>wincmd j<CR>]], options)
keymap("t", "<C-k>", [[<Cmd>wincmd k<CR>]], options)
keymap("t", "<C-l>", [[<Cmd>wincmd l<CR>]], options)

-- Map commentary
keymap("v", "<C-_>", "gc", {})
keymap("n", "<C-_>", "gcc", {})
keymap("i", "<C-_>", "<Esc>VgcA", {})

keymap("n", "<A-l>", ":bnext<CR>", options)
keymap("n", "<A-h>", ":bprev<CR>", options)

keymap("n", "<C-p>", '<cmd>lua require("telescope.builtin").find_files({ hidden=true, no_ignore=true })<CR>', options)
keymap("n", "<A-t>", "<cmd>NvimTreeToggle<CR>", options)

keymap("n", "go", "<Esc>", { desc = "Go Tool", noremap = true })
keymap("n", "gos", "<cmd>GoTestFunc -s<CR>", { desc = "Go Test Func Select", noremap = true })
keymap("n", "got", "<cmd>GoTestFunc<CR>", { desc = "Go Test Func", noremap = true })
keymap("n", "goT", "<cmd>GoTestFunc -F<CR>", { desc = "Go Test Func Floaterm", noremap = true })
keymap("n", "gof", "<cmd>GoFillStruct<CR>", { desc = "Go Fill Struct", noremap = true })
keymap("n", "goe", "<cmd>GoIfErr<CR>", { desc = "Go If Err", noremap = true })
keymap("i", "jf", "<cmd>GoFillStruct<CR>", { desc = "Go Fill Struct", noremap = true })
keymap("i", "je", "<cmd>GoIfErr<CR>", { desc = "Go Fill Struct", noremap = true })

-- lvim.builtin.which_key.mappings["go"] = {
--   name = "Go", -- optional group name
--   t = { "<cmd>GoTestFunc -s<CR>", "Go Test Func" }, -- create a binding with label
--   f = { "<cmd>GoFillStruct<Cr>", "Go Fill Struct" }, -- additional options for creating the keymap
-- }

lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.lsp.buffer_mappings.normal_mode["ga"] = { vim.lsp.buf.code_action, "Code action" }

lvim.builtin.telescope.defaults = {
  sorting_strategy = "ascending",
  layout_config = {
    horizontal = {
      prompt_position = "top"
    }
  },
  file_ignore_patterns = { "node_modules", "^.git/" }
}

lvim.builtin.terminal.direction = "horizontal"
lvim.builtin.terminal.open_mapping = "<F12>"
lvim.builtin.terminal.size = 8
-- Use which-key to add extra bindings with the leader-key prefix
lvim.builtin.which_key.mappings["f"] = { "<cmd>Telescope live_grep <CR>", "Find text" }
lvim.builtin.which_key.mappings["F"] = { "<cmd>Telescope grep_string <CR>", "Find current word" }
lvim.builtin.which_key.mappings["p"] = {
  "<cmd>lua require('telescope.builtin').find_files({ hidden=true, no_ignore=true })<CR>",
  "Find File"
}
lvim.builtin.which_key.mappings["P"] = {
  name = "Packer",
  c = { "<cmd>PackerCompile<cr>", "Compile" },
  -- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
  i = { "<cmd>PackerInstall<cr>", "Install" },
  r = { "<cmd>lua require('lvim.plugin-loader').recompile()<cr>", "Re-compile" },
  s = { "<cmd>PackerSync<cr>", "Sync" },
  S = { "<cmd>PackerStatus<cr>", "Status" },
  u = { "<cmd>PackerUpdate<cr>", "Update" }
}

lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- lvim.builtin.alpha.active = false
lvim.builtin.project.manual_mode = true
lvim.builtin.nvimtree.setup.sync_root_with_cwd = false
lvim.builtin.nvimtree.setup.update_cwd = false
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = false

lvim.builtin.cmp.completion = {
  completeopt = "menu,menuone,noinsert"
}

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
  "yaml"
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enabled = true

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  { command = "gofumpt", arg = "-extra", filetypes = { "go" } },
  { command = "goimports", filetypes = { "go" } },
  {
    command = "prettier",
    arg = "--find-config-path --stdin-filepath ${INPUT}",
    filetypes = { "javascript", "typescript" }
  }
}

local linters = require "lvim.lsp.null-ls.linters"
linters.setup {
  { command = "eslint_d", filetypes = { "javascript", "typescript" } }
}

-- Additional Plugins
lvim.plugins = {
  { "ghifarit53/tokyonight-vim" },
  {
    "iamcco/markdown-preview.nvim",
    run = function()
      vim.fn["mkdp#util#install"]()
    end
  },
  {
    "ray-x/go.nvim",
    config = function()
      require("go").setup()
    end
  },
  { "ray-x/guihua.lua" }
}

local startify = require("alpha.themes.startify")
local fortune = require("alpha.fortune")

local logo = {
  type = "text",
  val = {
    [[                                                                              ]],
    [[                                    ██████                                    ]],
    [[                                ████▒▒▒▒▒▒████                                ]],
    [[                              ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                              ]],
    [[                            ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                            ]],
    [[                          ██▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒                              ]],
    [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▓▓▓▓                          ]],
    [[                          ██▒▒▒▒▒▒  ▒▒▓▓▒▒▒▒▒▒  ▒▒▓▓                          ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒    ▒▒▒▒▒▒▒▒    ██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒██                        ]],
    [[                        ██▒▒██▒▒▒▒▒▒██▒▒▒▒▒▒▒▒██▒▒▒▒██                        ]],
    [[                        ████  ██▒▒██  ██▒▒▒▒██  ██▒▒██                        ]],
    [[                        ██      ██      ████      ████                        ]],
    [[                                                                              ]],
    [[                                                                              ]]
  },
  opts = {
    position = "center",
    hl = "Statement"
  }
}

local function info_value()
  local datetime = os.date(" %d-%m-%Y")

  return datetime
end

local info = {
  type = "text",
  val = info_value(),
  opts = {
    hl = "DevIconVim",
    position = "center"
  }
}

local message = {
  type = "text",
  val = fortune({ max_width = 60 }),
  opts = {
    position = "center",
    hl = "Statement"
  }
}

local header = {
  type = "group",
  val = {
    logo,
    info,
    message
  }
}

local mru = {
  type = "group",
  val = {
    {
      type = "text",
      val = "Current Dir",
      opts = {
        hl = "String",
        shrink_margin = false,
        position = "center"
      }
    },
    { type = "padding", val = 1 },
    {
      type = "group",
      val = function()
        return { startify.mru(1, vim.fn.getcwd(), 6) }
      end
    }
  }
}

local mru2 = {
  type = "group",
  val = {
    {
      type = "text",
      val = "Recent files",
      opts = {
        hl = "String",
        shrink_margin = false,
        position = "center"
      }
    },
    {
      type = "group",
      val = function()
        return { startify.mru(7, nil, 4) }
      end
    }
  }
}

local config = {
  layout = {
    header,
    { type = "padding", val = 1 },
    mru,
    { type = "padding", val = 1 },
    mru2
  },
  opts = {
    margin = 5
  }
}

lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "startify"
lvim.builtin.alpha["startify"].config = config
