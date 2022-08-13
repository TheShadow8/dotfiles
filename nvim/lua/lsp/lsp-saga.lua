local saga = require("lspsaga")

saga.init_lsp_saga(
    {
        border_style = "bold",
        show_diagnostic_source = true,
        -- diagnostic_header = {" ", " ", " ", "ﴞ "},
        -- diagnostic_header = {" ", " ", " ", " "},

        max_preview_lines = 20,
        code_action_icon = " ",
        code_action_lightbulb = {
            enable = true,
            sign = false,
            -- sign_priority = 20,
            virtual_text = true
        },
        finder_action_keys = {
            open = "<CR>",
            quit = "<ESC>"
            -- quit can be a table
        },
        code_action_keys = {
            quit = "<ESC>"
        },
        rename_action_quit = "<ESC>"
    }
)

vim.api.nvim_set_keymap("n", "<Leader>]", "<Cmd>Lspsaga diagnostic_jump_next<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>[", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gk", "<Cmd>Lspsaga hover_doc<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gh", "<Cmd>Lspsaga lsp_finder<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<Leader>ca", "<Cmd>Lspsaga code_action<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("v", "<Leader>ca", "<Cmd><C-U>Lspsaga range_code_action<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("i", "<C-k>", "<Cmd>Lspsaga signature_help<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "gs", "<Cmd>Lspsaga signature_help<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>gd", "<Cmd>Lspsaga preview_definition<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<Leader>cx", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", {noremap = true, silent = true})
vim.api.nvim_set_keymap("n", "<Leader>cd", "<Cmd>Lspsaga show_line_diagnostics<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap("n", "<Leader>gr", "<Cmd>Lspsaga rename<CR>", {noremap = true, silent = true})

vim.api.nvim_set_keymap(
    "n",
    "<C-f>",
    [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]],
    {noremap = true, silent = true}
)
vim.api.nvim_set_keymap(
    "n",
    "<C-b>",
    [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]],
    {noremap = true, silent = true}
)

-- vim.cmd [[autocmd CursorHold,CursorHoldI * lua require'lspsaga.diagnostic'.show_line_diagnostics()]]
