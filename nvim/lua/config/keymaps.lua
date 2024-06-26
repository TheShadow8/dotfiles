-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.api.nvim_set_keymap
local options = { noremap = true }
local options1 = { noremap = true, silent = true }

-- General
keymap("n", "<Leader>R", ":RefreshLSP<CR>", options)
keymap("n", "<Leader>q", ":q<CR>", options)
keymap("c", "jj", "<C-C>", options)
keymap("i", "jj", "<ESC>", options)
keymap("i", "jl", "<Right>", options)
keymap("i", "jh", "<Left>", options)
keymap("v", ">", ">gv", options)
keymap("v", "<", "<gv", options)
keymap("n", "<Leader>'", "ysiw", {})
keymap("n", '<Leader>"', "yss", {})
keymap("n", "<C-z>", "<nop>", options)
keymap("n", "<Space><Up>", ":resize +5<CR>", options)
keymap("n", "<Space><Down>", ":resize -5<CR>", options)
keymap("n", "<Space><Left>", ":vertical resize +5<CR>", options)
keymap("n", "<Space><Right>", ":vertical resize -5<CR>", options)
keymap("n", "<Leader>hh", ":noh<CR>", options)

-- Save
keymap("n", "<C-s>", ":w<CR>", options)
keymap("i", "<C-s>", "<ESC>:w<CR>", options)
keymap("v", "<C-s>", "<ESC>:w<CR>", options)

-- Make dir, file from current dir
keymap("n", "<Leader>w", ":! mkdir %:h/", options)
keymap("n", "<Leader>e", ":e %:h/", options)

-- Map commentary
keymap("v", "<Leader>/", "gc", {})
keymap("n", "<Leader>/", "gcc", {})
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

-- Navigate
keymap("n", "<A-l>", ":bnext<CR>", options)
keymap("n", "<A-h>", ":bprev<CR>", options)
keymap("n", "<Leader>d", ":bdelete<CR>", options)
keymap("n", "<C-k>", ":wincmd k<CR>", options1)
keymap("n", "<C-j>", ":wincmd j<CR>", options1)
keymap("n", "<C-h>", ":wincmd h<CR>", options1)
keymap("n", "<C-l>", ":wincmd l<CR>", options1)

-- Indent line
keymap("n", "<Leader>i", ":IndentLinesToggle<CR>", options)

-- Search and replace
keymap("n", "<Leader>s", "/\\<<C-r><C-w>\\>//<CR>", options)
keymap("n", "<Leader>S", ":%s/\\<<C-r><C-w>\\>//g<Left><Left>", options)

-- Git
keymap("n", "<Leader>G", ":Git", options)
keymap("n", "<Leader>b", ":BlamerToggle<CR>", options)

-- Get off my lawn
keymap("n", "<Left>", ':echo "Use h"<CR>', options)
keymap("n", "<Right>", ':echo "Use l"<CR>', options)
keymap("n", "<Up>", ':echo "Use k"<CR>', options)
keymap("n", "<Down>", ':echo "Use j"<CR>', options)

-- Nvimtree
keymap("n", "<A-t>", "<cmd>NvimTreeToggle<CR>", options)
keymap("n", "<Leader>e", "<cmd>NvimTreeToggle<CR>", options)
keymap("n", "<Leader>r", "<cmd>NvimTreeRefresh<CR>", options)
keymap("n", "<Leader>n", "<cmd>NvimTreeFindFile<CR>", options)

-- Telescope
keymap("n", "<Leader>B", '<cmd>lua require("telescope.builtin").file_browser()<CR>', options)
keymap("n", "<Leader>bb", '<cmd>lua require("telescope.builtin").buffers()<CR>', options)

keymap("n", "<C-p>", '<cmd>lua require("telescope.builtin").find_files({ hidden=true , no_ignore=true })<CR>', options)

keymap(
  "n",
  "<Leader>p",
  '<cmd>lua require("telescope.builtin").find_files({ hidden=true, no_ignore=true })<CR>',
  options
)

keymap("n", "<Leader>f", '<cmd>lua require("telescope.builtin").live_grep()<CR>', options)
keymap("n", "<Leader>F", '<cmd>lua require("telescope.builtin").grep_string()<CR>', options)
keymap("n", "<Leader><Leader>b", '<cmd>lua require("telescope.builtin").current_buffer_fuzzy_find()<CR>', options)

keymap("n", "<Leader><Leader>t", '<cmd>lua require("telescope.builtin").help_tags()<CR>', options)
keymap("n", "<Leader><Leader>r", '<cmd>lua require("telescope.builtin").lsp_references()<CR>', options)
keymap("n", "<Leader><Leader>s", '<cmd>lua require("telescope.builtin").lsp_document_symbols()<CR>', options)
keymap("n", "<Leader><Leader>l", '<cmd>lua require("telescope.builtin").lsp_workspace_diagnostics()<CR>', options)

keymap("n", "<Leader><Leader>g", '<cmd>lua require("telescope.builtin").git_status()<CR>', options)

-- LSP Saga
keymap("n", "<Leader>]", "<Cmd>Lspsaga diagnostic_jump_next<CR>", options1)
keymap("n", "<Leader>[", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", options1)

keymap("n", "K", "<Cmd>Lspsaga hover_doc<CR>", options1)
keymap("n", "gh", "<Cmd>Lspsaga finder def+ref<CR>", options1)

keymap("n", "ga", "<Cmd>Lspsaga code_action<CR>", options1)
keymap("v", "ga", "<Cmd><C-U>Lspsaga range_code_action<CR>", options1)

keymap("n", "<Leader>gd", "<Cmd>Lspsaga peek_definition<CR>", options1)

keymap("n", "gk", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", options1)
keymap("n", "gl", "<Cmd>Lspsaga show_line_diagnostics<CR>", options1)

keymap("n", "<Leader>gr", "<Cmd>Lspsaga rename<CR>", options1)

keymap("n", "<C-f>", [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<CR>]], options1)
keymap("n", "<C-b>", [[<Cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<CR>]], options1)

-- Go tool
keymap("i", "jf", "<cmd>GoFillStruct<CR>", { desc = "Go Fill Struct", noremap = true })
keymap("i", "je", "<cmd>GoIfErr<CR>", { desc = "Go Fill Struct", noremap = true })

-- Floaterm
keymap("n", "<F7>", ":FloatermNew<CR>", options1)
keymap("t", "<F7>", "<C-\\><C-n>:FloatermNew<CR>", options1)
keymap("n", "<F8>", ":FloatermPrev<CR>", options1)
keymap("t", "<F8>", "<C-\\><C-n>:FloatermPrev<CR>", options1)
keymap("n", "<F9>", ":FloatermNext<CR>", options1)
keymap("t", "<F9>", "<C-\\><C-n>:FloatermNext<CR>", options1)
keymap("n", "<F10>", ":FloatermToggle<CR>", options1)
keymap("t", "<F10>", "<C-\\><C-n>:FloatermToggle<CR>", options1)
keymap("n", "<F12>", ":FloatermToggle<CR>", options1)
keymap("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", options1)
keymap("t", "<Leader><Esc>", "<C-\\><C-n>", options1)

keymap("n", "<Leader>L", ":Lazygit<CR>", options1)
