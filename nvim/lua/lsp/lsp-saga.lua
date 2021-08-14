local saga = require ('lspsaga')

saga.init_lsp_saga {
  error_sign = '',
  warn_sign = '',
  hint_sign = '',
  infor_sign = '',
  border_style = "round",
  finder_action_keys = { quit = '<ESC>' },
  code_action_keys = { quit = '<ESC>' },
  rename_action_keys = { quit = '<ESC>'},
}

vim.api.nvim_set_keymap('n', '<Leader>]','<Cmd>Lspsaga diagnostic_jump_next<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>[','<Cmd>Lspsaga diagnostic_jump_prev<CR>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', 'K','<Cmd>Lspsaga hover_doc<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'gh','<Cmd>Lspsaga lsp_finder<CR>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<Leader>ca','<Cmd>Lspsaga code_action<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('v', '<Leader>ca','<Cmd><C-U>Lspsaga range_code_action<CR>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('i', '<C-k>','<Cmd>Lspsaga signature_help<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'gs','<Cmd>Lspsaga signature_help<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', 'gd','<Cmd>Lspsaga preview_definition<CR>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<Leader>cx','<Cmd>Lspsaga show_cursor_diagnostics<CR>', {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<Leader>cd','<Cmd>Lspsaga show_line_diagnostics<CR>', {noremap=true, silent=true})

vim.api.nvim_set_keymap('n', '<C-w>',[[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], {noremap=true, silent=true})
vim.api.nvim_set_keymap('n', '<C-b>',[[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], {noremap=true, silent=true})

