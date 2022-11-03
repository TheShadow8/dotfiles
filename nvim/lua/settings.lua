local o = vim.o
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local ncmd = vim.api.nvim_command

for key, val in pairs(
  {
    encoding = "utf8",
    -- nocompatible = true,
    number = true,
    relativenumber = true,
    tabstop = 2,
    shiftwidth = 2,
    smarttab = true,
    expandtab = true,
    errorbells = false,
    wildmenu = true, -- Show menu to move to select. Example: find
    history = 50,
    clipboard = o.clipboard .. "unnamedplus",
    backspace = "indent,eol,start",
    guifont = "Inconsolata",
    bg = "dark",
    undodir = os.getenv("HOME") .. "/.vim/undodir",
    undofile = true,
    incsearch = true,
    swapfile = false,
    cursorline = true,
    backup = false,
    writebackup = false,
    smartindent = true,
    cmdheight = 2,
    shortmess = o.shortmess .. "c",
    hlsearch = true,
    sidescroll = 1,
    wrap = false,
    switchbuf = "usetab",
    lazyredraw = true,
    title = true,
    mouse = "a",
    hidden = true,
    updatetime = 300,
    smartcase = true, -- Auto switch to case sensitive when Upper-case use (exp: Search ...),
    colorcolumn = "80",
    termguicolors = true, -- enable true colors support (24 bit colors) let g:go_def_mapping_enabled = 0,
    titlestring = '%t%( %M%)%( (%{expand("%:~:.:h")})%)%( %a%)', -- configure title to look like: Vim /path/to/file,
    completeopt = "menu,menuone,noselect",
    laststatus = 2, -- Always display the status line
    background = "dark",
    signcolumn = "number",
    scrolloff = 6,
    wildignore = "*/node_modules/*,*/dist/*",
    grepprg = "rg --vimgrep --no-heading --smart-case",
    grepformat = "%f:%l:%c:%m",
    timeoutlen = 300
  }
) do
  o[key] = val
end

g.mapleader = " "

g.node_client_debug = 1
g.floaterm_width = 0.9
g.floaterm_height = 0.9
g.indentLine_enabled = 0

g.startify_change_to_dir = 0
g.startify_change_to_vcs_root = 1
g.startify_lists = {
  -- {type = "files", header = {"   Files"}},
  { type = "dir", header = { ("  Current Directory " .. fn.getcwd()) } },
  { type = "sessions", header = { "   Sessions" } },
  { type = "bookmarks", header = { "   Bookmarks" } }
}

g.mta_filetypes = {
  html = 1,
  xhtml = 1,
  xml = 1,
  jinja = 1,
  javascript = 1,
  typescript = 1
}

g.blamer_delay = 200

cmd("filetype plugin indent on")
cmd("colorscheme tokyonight") -- gruvbox, codedark, ayu, dracula, tokyonight, gruvbox8, sonokai

cmd([[au VimEnter * highlight LspReferenceText term=bold cterm=bold guibg=Grey40]])
cmd([[au VimEnter * highlight LspReferenceWrite term=bold cterm=bold guibg=Grey40]])
cmd([[au VimEnter * highlight LspReferenceRead term=bold cterm=bold guibg=Grey40]])

cmd [[au VimEnter * highlight Floaterm guibg=#505050]]
cmd [[au VimEnter * highlight FloatermBorder guibg=#505050]]

cmd [[au VimEnter * hi GitSignsAdd guifg=#00D000 ctermfg=2]]
cmd [[au VimEnter * hi GitSignsChange guifg=#EBEB00 ctermfg=3]]
cmd [[au VimEnter * hi GitSignsDelete guifg=#ff2222 ctermfg=1]]

-- cmd [[au VimEnter * hi Normal guibg=#0e0e0e ctermfg=16]]

--- ### Autocmd
ncmd [[autocmd VimEnter * silent! lcd%:p:h]]
ncmd [[autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'cd '.argv()[0] | exe 'Startify' | endif]]
ncmd [[autocmd BufRead,BufNewFile *.ejs setfiletype html]]

cmd [[ 
function RefreshLSP()
	lua vim.lsp.stop_client(vim.lsp.get_active_clients())
	sleep 500m
	edit
endfunction

command RefreshLSP call RefreshLSP()
]]

cmd [[command! Lazygit FloatermNew lazygit]]

-- cmd [[autocmd CursorHold,CursorHoldI * lua require'lspsaga.diagnostic'.show_line_diagnostics()]]
