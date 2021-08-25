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
        clipboard = vim.o.clipboard .. "unnamedplus",
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
        shortmess = vim.o.shortmess .. "c",
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
        completeopt = "menuone,noselect",
        laststatus = 2, -- Always display the status line
        background = "dark",
        signcolumn = "number"
    }
) do
    vim.o[key] = val
end

vim.cmd("filetype plugin indent on")
vim.cmd("colorscheme sonokai") -- gruvbox, codedark, ayu, dracula, tokyonight, gruvbox8, sonokai

vim.cmd("hi GitGutterAdd  guifg=#009900 ctermfg=2")
vim.cmd("hi GitGutterChange guifg=#bbbb00 ctermfg=3")
vim.cmd("hi GitGutterDelete guifg=#ff2222 ctermfg=1")

vim.cmd("hi Floaterm guifg=#424242")
vim.cmd("hi FloatermBorder guifg=#424242")

vim.g.mapleader = ";"
vim.g.node_client_debug = 1
vim.g.floaterm_width = 0.9
vim.g.floaterm_height = 0.9
vim.g.indentLine_enabled = 0

vim.g.startify_change_to_dir = 1
vim.g.startify_change_to_vcs_root = 1
vim.g.startify_lists = {
    {type = "files", header = {"   Files"}},
    {type = "dir", header = {("  Current Directory " .. vim.fn.getcwd())}},
    {type = "sessions", header = {"   Sessions"}},
    {type = "bookmarks", header = {"   Bookmarks"}}
}

vim.g.delimitMate_expand_space = 1

vim.g.VM_maps = {
    ["Select Cursor Down"] = "<A-Down>",
    ["Select Cursor Up"] = "<A-Up>"
}
vim.g.VM_mouse_mappings = 1

--- ### Autocmd
vim.api.nvim_command [[autocmd VimEnter * silent! lcd%:p:h]]
vim.api.nvim_command [[autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'cd '.argv()[0] | exe 'Startify' | endif]]
vim.api.nvim_command [[autocmd BufRead,BufNewFile *.ejs setfiletype html]]

--- ### Mapping
local options = {noremap = true}
local options1 = {noremap = true, silent = true}
local options2 = {noremap = true, silent = true, expr = true}

-- General
vim.api.nvim_set_keymap("c", "jk", "<C-C>", options)
vim.api.nvim_set_keymap("i", "jj", "<ESC>", options)
vim.api.nvim_set_keymap("i", "<Leader>;", "<Right>", options)
vim.api.nvim_set_keymap("i", "<Leader>dd", "<ESC>ddi", options)
vim.api.nvim_set_keymap("i", "<Leader>>", "<ESC>>>a", options)
vim.api.nvim_set_keymap("i", "<Leader><", "<ESC><<a", options)
vim.api.nvim_set_keymap("v", ">", ">gv", options)
vim.api.nvim_set_keymap("v", "<", "<gv", options)

-- Make dir, file from current dir
vim.api.nvim_set_keymap("n", "<Leader>w", ":! mkdir %:h/", options)
vim.api.nvim_set_keymap("n", "<Leader>e", ":e %:h/", options)

vim.api.nvim_set_keymap("i", "<Leader>w", "<ESC>:! mkdir %:h/", options)
vim.api.nvim_set_keymap("i", "<Leader>e", "<ESC>:e %:h/", options)

-- Map commentary
vim.api.nvim_set_keymap("v", "<C-_>", "gc", {})
vim.api.nvim_set_keymap("n", "<C-_>", "gcc", {})
vim.api.nvim_set_keymap("i", "<C-_>", "<Esc>VgcA", {})

-- Move a line down/up
vim.api.nvim_set_keymap("n", "<A-j>", ":m .+1<CR>==", options)
vim.api.nvim_set_keymap("n", "<A-k>", ":m .-2<CR>==", options)
vim.api.nvim_set_keymap("i", "<A-j>", "<Esc>:m .+1<CR>==gi", options)
vim.api.nvim_set_keymap("i", "<A-k>", "<Esc>:m .-2<CR>==gi", options)
vim.api.nvim_set_keymap("v", "<A-j>", ":m '>+1<CR>gv=gv", options)
vim.api.nvim_set_keymap("v", "<A-k>", ":m '<-2<CR>gv=gv", options)

vim.api.nvim_set_keymap("n", "<A-l>", ":bnext<CR>", options)
vim.api.nvim_set_keymap("n", "<A-h>", ":bprev<CR>", options)
vim.api.nvim_set_keymap("n", "<Leader>d", ":bdelete<CR>", options)
vim.api.nvim_set_keymap("n", "<Leader>c", ":copen<CR>", options)
vim.api.nvim_set_keymap("n", "<Leader>cc", ":cclose<CR>", options)

-- Git Gutter
vim.api.nvim_set_keymap("n", "]h", "<Plug>(GitGutterNextHunk)", {})
vim.api.nvim_set_keymap("n", "[h", "<Plug>(GitGutterPrevHunk)", {})

-- Indent line
vim.api.nvim_set_keymap("n", "<Leader>i", ":IndentLinesToggle<CR>", options)

-- Git blamer
vim.api.nvim_set_keymap("n", "<Leader>gb", ":BlamerToggle<CR>", options)

vim.api.nvim_set_keymap("n", "<C-z>", "<nop>", options)

vim.api.nvim_set_keymap("n", "<C-s>", ":w<CR>", options)
vim.api.nvim_set_keymap("i", "<C-s>", "<ESC>:w<CR>", options)
vim.api.nvim_set_keymap("v", "<C-s>", "<ESC>:w<CR>", options)

vim.api.nvim_set_keymap("n", "<Leader>s", ":w<CR>", options)
vim.api.nvim_set_keymap("i", "<Leader>s", "<ESC>:w<CR>", options)
vim.api.nvim_set_keymap("v", "<Leader>s", "<ESC>:w<CR>", options)

vim.api.nvim_set_keymap("n", "<Leader>h", ":noh<CR>", options)

vim.api.nvim_set_keymap("n", "<Leader>G", ":Git", options)

vim.api.nvim_set_keymap("n", "<Space><Up>", ":resize +2<CR>", options)
vim.api.nvim_set_keymap("n", "<Space><Down>", ":resize -2<CR>", options)
vim.api.nvim_set_keymap("n", "<Space><Left>", ":vertical resize +2<CR>", options)
vim.api.nvim_set_keymap("n", "<Space><Right>", ":vertical resize -2<CR>", options)

vim.api.nvim_set_keymap("n", "<C-k>", ":wincmd k<CR>", options1)
vim.api.nvim_set_keymap("n", "<C-j>", ":wincmd j<CR>", options1)
vim.api.nvim_set_keymap("n", "<C-h>", ":wincmd h<CR>", options1)
vim.api.nvim_set_keymap("n", "<C-l>", ":wincmd l<CR>", options1)
-- Get off my lawn
vim.api.nvim_set_keymap("n", "<Left>", ':echo "Use h"<CR>', options)
vim.api.nvim_set_keymap("n", "<Right>", ':echo "Use l"<CR>', options)
vim.api.nvim_set_keymap("n", "<Up>", ':echo "Use k"<CR>', options)
vim.api.nvim_set_keymap("n", "<Down>", ':echo "Use j"<CR>', options)

vim.api.nvim_set_keymap("n", "<F7>", ":FloatermNew<CR>", options1)
vim.api.nvim_set_keymap("t", "<F7>", "<C-\\><C-n>:FloatermNw<CR>", options1)
vim.api.nvim_set_keymap("n", "<F8>", ":FloatermPrev<CR>", options1)
vim.api.nvim_set_keymap("t", "<F8>", "<C-\\><C-n>:FloatermPrev<CR>", options1)
vim.api.nvim_set_keymap("n", "<F9>", ":FloatermNext<CR>", options1)
vim.api.nvim_set_keymap("t", "<F9>", "<C-\\><C-n>:FloatermNext<CR>", options1)
vim.api.nvim_set_keymap("n", "<F12>", ":FloatermToggle<CR>", options1)
vim.api.nvim_set_keymap("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", options1)

vim.api.nvim_set_keymap("i", "<CR>", 'compe#confirm({ "keys": "\\<Plug>delimitMateCR", "mode": "" })', options2)
