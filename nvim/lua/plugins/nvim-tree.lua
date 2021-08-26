local g = vim.g

-- g.nvim_tree_side = "right"
g.nvim_tree_width = 40
g.nvim_tree_ignore = {".git", "node_modules", ".cache"}
g.nvim_tree_gitignore = 1
g.nvim_tree_auto_open = 1
g.nvim_tree_auto_close = 0
g.nvim_tree_auto_ignore_ft = {"startify", "dashboard"}
g.nvim_tree_quit_on_open = 1
g.nvim_tree_follow = 1
g.nvim_tree_indent_markers = 1
g.nvim_tree_hide_dotfiles = 0
g.nvim_tree_git_hl = 1
g.nvim_tree_highlight_opened_files = 1
g.nvim_tree_root_folder_modifier = ":~"
g.nvim_tree_tab_open = 1
g.nvim_tree_auto_resize = 0
g.nvim_tree_disable_netrw = 0
g.nvim_tree_hijack_netrw = 0
g.nvim_tree_add_trailing = 1
g.nvim_tree_group_empty = 1
g.nvim_tree_lsp_diagnostics = 1
g.nvim_tree_disable_window_picker = 1
g.nvim_tree_hijack_cursor = 0
g.nvim_tree_icon_padding = " "
g.nvim_tree_symlink_arrow = " >> "
g.nvim_tree_update_cwd = 1
g.nvim_tree_respect_buf_cwd = 1
g.nvim_tree_window_picker_exclude = {
    filetype = {
        "packer",
        "qf"
    },
    buftype = {
        "terminal"
    }
}
g.nvim_tree_special_files = {Makefile = 1, MAKEFILE = 1}
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

local options = {noremap = true}

vim.api.nvim_set_keymap("n", "<A-t>", "<cmd> NvimTreeToggle<CR>", options)
vim.api.nvim_set_keymap("n", "<Leader>r", "<cmd>NvimTreeRefresh<CR>", options)
vim.api.nvim_set_keymap("n", "<Leader>n", "<cmd>NvimTreeFindFile<CR>", options)
