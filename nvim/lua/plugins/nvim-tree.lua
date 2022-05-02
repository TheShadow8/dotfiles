local g = vim.g

-- following options are the default
require "nvim-tree".setup {
  -- disables netrw completely
  disable_netrw = true,
  -- hijack netrw window on startup
  hijack_netrw = true,
  -- open the tree when running this setup function
  open_on_setup = false,
  -- will not open on setup if the filetype is in this list
  ignore_ft_on_setup = { "startify", "dashboard" },
  -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
  open_on_tab = false,
  -- hijack the cursor in the tree to put it at the start of the filename
  hijack_cursor = false,
  -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
  update_cwd = false,
  -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
  update_focused_file = {
    -- enables the feature
    enable = false,
    -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
    -- only relevant when `update_focused_file.enable` is true
    update_cwd = false,
    -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
    -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
    ignore_list = {}
  },
  -- configuration options for the system open command (`s` in the tree by default)
  system_open = {
    -- the command to run this, leaving nil should work in most cases
    cmd = nil,
    -- the command arguments as a list
    args = {}
  }
}

-- g.nvim_tree_side = "right"
g.nvim_tree_width = 35
g.nvim_tree_ignore = { ".git", "node_modules", ".cache" }
g.nvim_tree_gitignore = 0
g.nvim_tree_quit_on_open = 1
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 0
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = ":~"
g.nvim_tree_tab_open = 0
g.nvim_tree_auto_resize = 0
g.nvim_tree_add_trailing = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_hijack_cursor = 0
g.nvim_tree_icon_padding = " "
g.nvim_tree_symlink_arrow = " >> "
g.nvim_tree_update_cwd = 1
g.nvim_tree_respect_buf_cwd = 0
g.nvim_tree_window_picker_exclude = {
  filetype = {
    "packer",
    "qf"
  },
  buftype = {
    "terminal"
  }
}

local sf = {}
sf["Makefile"] = 1
sf["MAKEFILE"] = 1
g.nvim_tree_special_files = sf

g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1
}

g.nvim_tree_icons = {
  default = "",
  symlink = "",
  git = {
    unstaged = "✗",
    staged = "✓",
    unmerged = "",
    renamed = "➜",
    untracked = "★",
    deleted = "",
    ignored = "◌"
  },
  folder = {
    arrow_open = "",
    arrow_closed = "",
    default = "",
    open = "",
    empty = "",
    empty_open = "",
    symlink = "",
    symlink_open = ""
  },
  lsp = {
    hint = "",
    info = "",
    warning = "",
    error = ""
  }
}

local options = { noremap = true }

vim.api.nvim_set_keymap("n", "<A-t>", "<cmd>NvimTreeToggle<CR>", options)
vim.api.nvim_set_keymap("n", "<Leader>r", "<cmd>NvimTreeRefresh<CR>", options)
vim.api.nvim_set_keymap("n", "<Leader>n", "<cmd>NvimTreeFindFile<CR>", options)
