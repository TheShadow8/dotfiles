local actions = require("telescope.actions")

require("telescope").setup {
    defaults = {
        vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case"
        },
        sorting_strategy = "ascending",
        layout_config = {
            horizontal = {
                prompt_position = "top"
            }
        },
        mappings = {
            i = {
                ["<Esc>"] = actions.close,
                ["<C-n>"] = actions.move_selection_next,
                ["<C-p>"] = actions.move_selection_previous,
                ["<C-j>"] = actions.move_selection_next,
                ["<C-k>"] = actions.move_selection_previous,
                ["<C-c>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down
            },
            n = {
                ["<Esc>"] = actions.close,
                ["<CR>"] = actions.select_default + actions.center,
                ["<C-x>"] = actions.select_horizontal,
                ["<C-v>"] = actions.select_vertical,
                ["j"] = actions.move_selection_next,
                ["k"] = actions.move_selection_previous,
                ["<C-u>"] = actions.preview_scrolling_up,
                ["<C-d>"] = actions.preview_scrolling_down
            }
        }
    }
}

local options = {
    noremap = true
}

vim.api.nvim_set_keymap("n", "<Leader>B", '<cmd>lua require("telescope.builtin").file_browser()<CR>', options)
vim.api.nvim_set_keymap("n", "<Leader>bb", '<cmd>lua require("telescope.builtin").buffers()<CR>', options)

vim.api.nvim_set_keymap("n", "<C-p>", '<cmd>lua require("telescope.builtin").find_files({ hidden=true })<CR>', options)

vim.api.nvim_set_keymap("n", "<Leader>f", '<cmd>lua require("telescope.builtin").live_grep()<CR>', options)
vim.api.nvim_set_keymap("n", "<Leader>F", '<cmd>lua require("telescope.builtin").grep_string()<CR>', options)
vim.api.nvim_set_keymap(
    "n",
    "<Leader>bf",
    '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>',
    options
)

vim.api.nvim_set_keymap("n", "<Leader>t", '<cmd>lua require("telescope.builtin").help_tags()<CR>', options)
vim.api.nvim_set_keymap("n", "<Leader>rf", '<cmd>lua require("telescope.builtin").lsp_references()<CR>', options)
