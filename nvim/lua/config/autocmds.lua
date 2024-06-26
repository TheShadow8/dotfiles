-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
local cmd = vim.cmd
local ncmd = vim.api.nvim_command

cmd("filetype plugin indent on")
-- cmd("colorscheme tokyonight") -- gruvbox, codedark, ayu, dracula, tokyonight, gruvbox8, sonokai

cmd([[au VimEnter * highlight LspReferenceText term=bold cterm=bold guibg=Grey40]])
cmd([[au VimEnter * highlight LspReferenceWrite term=bold cterm=bold guibg=Grey40]])
cmd([[au VimEnter * highlight LspReferenceRead term=bold cterm=bold guibg=Grey40]])

cmd([[au VimEnter * highlight Floaterm guibg=#505050]])
cmd([[au VimEnter * highlight FloatermBorder guibg=#505050]])

cmd([[au VimEnter * hi GitSignsAdd guifg=#00D000 ctermfg=2]])
cmd([[au VimEnter * hi GitSignsChange guifg=#EBEB00 ctermfg=3]])
cmd([[au VimEnter * hi GitSignsDelete guifg=#ff2222 ctermfg=1]])

-- cmd [[au VimEnter * hi Normal guibg=#0e0e0e ctermfg=16]]

--- ### Autocmd
ncmd([[autocmd VimEnter * silent! lcd%:p:h]])
ncmd(
  [[autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'cd '.argv()[0] | exe 'Startify' | endif]]
)
ncmd([[autocmd BufRead,BufNewFile *.ejs setfiletype html]])

cmd([[ 
function RefreshLSP()
	lua vim.lsp.stop_client(vim.lsp.get_active_clients())
	sleep 500m
	edit
endfunction

command RefreshLSP call RefreshLSP()
]])

cmd([[command! Lazygit FloatermNew lazygit]])

-- cmd [[autocmd CursorHold,CursorHoldI * lua require'lspsaga.diagnostic'.show_line_diagnostics()]]
