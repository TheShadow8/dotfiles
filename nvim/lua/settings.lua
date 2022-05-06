local o = vim.o
local g = vim.g
local cmd = vim.cmd
local fn = vim.fn
local ncmd = vim.api.nvim_command
local keymap = vim.api.nvim_set_keymap

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
  guifont = "Fira Code:h13",
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
  grepformat = "%f:%l:%c:%m"
}
) do
  o[key] = val
end

cmd("filetype plugin indent on")
cmd("colorscheme tokyonight") -- gruvbox, codedark, ayu, dracula, tokyonight, gruvbox8, sonokai

cmd [[au VimEnter * highlight Floaterm guibg=#505050]]
cmd [[au VimEnter * highlight FloatermBorder guibg=#505050]]

cmd [[au VimEnter * hi GitSignsAdd guifg=#00D000 ctermfg=2]]
cmd [[au VimEnter * hi GitSignsChange guifg=#EBEB00 ctermfg=3]]
cmd [[au VimEnter * hi GitSignsDelete guifg=#ff2222 ctermfg=1]]

g.mapleader = ";"
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

--- ### Mapping
local options = { noremap = true }
local options1 = { noremap = true, silent = true }

-- General

keymap("n", "<Leader>R", ":RefreshLSP<CR>", options)
keymap("c", "jj", "<C-C>", options)
keymap("i", "jj", "<ESC>", options)
keymap("i", "jl", "<Right>", options)
keymap("v", ">", ">gv", options)
keymap("v", "<", "<gv", options)

-- Make dir, file from current dir
keymap("n", "<Leader>w", ":! mkdir %:h/", options)
keymap("n", "<Leader>e", ":e %:h/", options)

-- Map commentary
keymap("v", "<C-_>", "gc", {})
keymap("n", "<C-_>", "gcc", {})
keymap("i", "<C-_>", "<Esc>VgcA", {})

-- Move a line down/up
keymap("n", "<A-j>", ":m .+1<CR>==", options)
keymap("n", "<A-k>", ":m .-2<CR>==", options)
keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", options)
keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", options)
keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", options)
keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", options)

keymap("n", "<A-l>", ":bnext<CR>", options)
keymap("n", "<A-h>", ":bprev<CR>", options)
keymap("n", "<Leader>d", ":bdelete<CR>", options)

-- Indent line
keymap("n", "<Leader>i", ":IndentLinesToggle<CR>", options)

keymap("n", "<C-z>", "<nop>", options)

keymap("n", "<C-s>", ":w<CR>", options)
keymap("i", "<C-s>", "<ESC>:w<CR>", options)
keymap("v", "<C-s>", "<ESC>:w<CR>", options)

keymap("n", "<Leader>s", "/\\<<C-r><C-w>\\>//<CR>", options)
keymap("n", "<Leader>S", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", options)

keymap("n", "<Leader>hh", ":noh<CR>", options)

keymap("n", "<Leader>G", ":Git", options)
keymap("n", "<Leader>b", ":BlamerToggle<CR>", options)

keymap("n", "<Space><Up>", ":resize +5<CR>", options)
keymap("n", "<Space><Down>", ":resize -5<CR>", options)
keymap("n", "<Space><Left>", ":vertical resize +5<CR>", options)
keymap("n", "<Space><Right>", ":vertical resize -5<CR>", options)

keymap("n", "<C-k>", ":wincmd k<CR>", options1)
keymap("n", "<C-j>", ":wincmd j<CR>", options1)
keymap("n", "<C-h>", ":wincmd h<CR>", options1)
keymap("n", "<C-l>", ":wincmd l<CR>", options1)
-- Get off my lawn
keymap("n", "<Left>", ':echo "Use h"<CR>', options)
keymap("n", "<Right>", ':echo "Use l"<CR>', options)
keymap("n", "<Up>", ':echo "Use k"<CR>', options)
keymap("n", "<Down>", ':echo "Use j"<CR>', options)

keymap("n", "<F7>", ":FloatermNew<CR>", options1)
keymap("t", "<F7>", "<C-\\><C-n>:FloatermNew<CR>", options1)
keymap("n", "<F8>", ":FloatermPrev<CR>", options1)
keymap("t", "<F8>", "<C-\\><C-n>:FloatermPrev<CR>", options1)
keymap("n", "<F9>", ":FloatermNext<CR>", options1)
keymap("t", "<F9>", "<C-\\><C-n>:FloatermNext<CR>", options1)
keymap("n", "<F12>", ":FloatermToggle<CR>", options1)
keymap("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", options1)
keymap("t", "<Esc>", "<C-\\><C-n>", options1)
