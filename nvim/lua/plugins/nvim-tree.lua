return {
  "nvim-tree/nvim-tree.lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  config = function()
    local nvimtree = require("nvim-tree")
    nvimtree.setup({
      disable_netrw = true,
      -- hijack netrw window on startup
      hijack_netrw = true,
      -- open the tree when running this setup function
      -- open_on_setup = false,
      sync_root_with_cwd = true,
      -- will not open on setup if the filetype is in this list
      -- ignore_ft_on_setup = {"startify", "dashboard"},
      -- opens the tree when changing/opening a new tab if the tree wasn't previously opened
      open_on_tab = false,
      -- hijack the cursor in the tree to put it at the start of the filename
      hijack_cursor = false,
      -- updates the root directory of the tree on `DirChanged` (when your run `:cd` usually)
      update_cwd = false,
      -- update the focused file on `BufEnter`, un-collapses the folders recursively until it finds the file
      update_focused_file = {
        -- enables the feature
        enable = true,
        -- update the root directory of the tree to the one of the folder containing the file if the file is not under the current root directory
        -- only relevant when `update_focused_file.enable` is true
        update_cwd = false,
        -- list of buffer names / filetypes that will not update the cwd if the file isn't found under the current root directory
        -- only relevant when `update_focused_file.update_cwd` is true and `update_focused_file.enable` is true
        ignore_list = {},
      },
      -- configuration options for the system open command (`s` in the tree by default)
      system_open = {
        -- the command to run this, leaving nil should work in most cases
        cmd = nil,
        -- the command arguments as a list
        args = {},
      },
      filters = {
        dotfiles = true,
        custom = { ".git", "node_modules", ".cache" },
        exclude = { ".env", ".air.toml" },
      },
      git = {
        ignore = false,
      },
      renderer = {
        add_trailing = true,
        group_empty = true,
        highlight_git = true,
        full_name = false,
        highlight_opened_files = "all",
      },
      diagnostics = {
        enable = false,
      },
    })
  end,
}

