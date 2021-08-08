if !exists('g:loaded_lspsaga') | finish | endif

lua << EOF
local saga = require 'lspsaga'

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

EOF

nnoremap <silent> <Leader>] <Cmd>Lspsaga diagnostic_jump_next<CR>
nnoremap <silent> <Leader>[ <Cmd>Lspsaga diagnostic_jump_prev<CR>
nnoremap <silent>K <Cmd>Lspsaga hover_doc<CR>
inoremap <silent> <C-k> <Cmd>Lspsaga signature_help<CR>
nnoremap <silent> gh <Cmd>Lspsaga lsp_finder<CR>
nnoremap <silent><leader>ca :Lspsaga code_action<CR>
vnoremap <silent><leader>ca :<C-U>Lspsaga range_code_action<CR>
nnoremap <silent> gs :Lspsaga signature_help<CR>
nnoremap <silent><leader>gd <cmd>lua require'lspsaga.provider'.preview_definition()<CR>
nnoremap <silent> <C-w> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>
nnoremap <silent> <C-b> <cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>

nnoremap <silent><leader>cx <cmd>lua require'lspsaga.diagnostic'.show_cursor_diagnostics()<CR>
nnoremap <silent><leader>cd <cmd>lua require'lspsaga.diagnostic'.show_line_diagnostics()<CR>
