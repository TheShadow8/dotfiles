set encoding=utf8
set nocompatible              " be iMproved, required
filetype on " required
filetype plugin indent on    " required
set number relativenumber
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set noerrorbells
set wildmenu " Show menu to move to select. Example: find 
set history=50
set clipboard+=unnamedplus
" OSX stupid backspace fix
set backspace=indent,eol,start
let g:node_client_debug = 1
set clipboard+=unnamed
set guifont=Fira\ Code:h13
set number " Show linenumbers
set bg=dark
set undodir=~/.vim/undodir
set undofile
set incsearch
set noswapfile
set cursorline
set nobackup
set nowritebackup
set smartindent
set cmdheight=2
set shortmess+=c
set hlsearch
set sidescroll=1
set nowrap
set switchbuf=usetab
set lazyredraw
" enable setting title
set title
set mouse=a


" set termwinsize=15x0
set hidden
set updatetime=300

set smartcase " Auto switch to case sensitive when Upper-case use (exp: Search ...)
set colorcolumn=80
set termguicolors     " enable true colors support (24 bit colors) let g:go_def_mapping_enabled = 0
" let loaded_netrwPlugin = 1
" configure title to look like: Vim /path/to/file
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)

set completeopt=menuone,noselect


let mapleader=";"

"Autocmd
autocmd VimEnter * silent! :lcd%:p:h
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'cd '.argv()[0] | exe 'Startify' | endif

"Import files
" source $HOME/.config/nvim/plugs.vim
" source $HOME/.config/nvim/fzf.vim
" source $HOME/.config/nvim/nerdtree.vim
source $HOME/.config/nvim/defx.vim
:lua require('')



" Always display the status line
set laststatus=2

" Theme
set background=dark
let g:floaterm_width=0.9
let g:floaterm_height=0.9
let ayucolor="mirage" " dark, mirage, light for mirage version of theme
colorscheme sonokai " gruvbox, codedark, ayu, dracula, tokyonight, gruvbox8, sonokai

" let g:molokai_original = 0
" let g:spacegray_underline_search = 1
" let g:spacegray_italicize_comments = 1

" highlight Normal guibg=black guifg=white



"============Configuration===========================================

cnoremap jk <c-c>

inoremap jj <ESC>
inoremap <leader>; <Right>
inoremap <leader>dd <Esc>ddi
inoremap <leader>> <esc>>>a
inoremap <leader>< <esc><<a
vnoremap < <gv
vnoremap > >gv

" Make dir, file from current dir
nnoremap <Leader>w :! mkdir %:h/
nnoremap <Leader>e :e %:h/

inoremap <Leader>w <ESC>:! mkdir %:h/
inoremap <Leader>e <ESC>:e %:h/

" Map commentary
vmap <C-_> gc
nmap <C-_> gcc
imap <C-_> <Esc>VgcA

" Move a line down/up
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

nnoremap <A-l> :bnext<CR>
nnoremap <A-h> :bprev<CR>
nnoremap <Leader>d :bdelete<CR>
nnoremap <Leader>c :copen<CR>
nnoremap <Leader>cc :cclose<CR>

" Git Gutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Indent line
let g:indentLine_enabled = 0
nnoremap <Leader>i :IndentLinesToggle<CR>

" Git blamer
nnoremap <Leader>gb :BlamerToggle<CR>

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Ranger
nmap <space>r :RnvimrToggle<CR>

"================Mapping configuration===============

function! FindInCurrentDir()
        if isdirectory(".git")
               return ':GFiles --exclude-standard --others --cached'
        else 
                return ':Files'
        endif        
endfunction

" map <C-p> :execute FindInCurrentDir()<CR>

map <C-z> <nop>

let g:VM_maps = {}

let g:VM_maps["Select Cursor Down"] = '<A-Down>'
let g:VM_maps["Select Cursor Up"] = '<A-Up>'
let g:VM_mouse_mappings = 1


" Mapping selecting Mappings
nmap <leader><tab> <plug>(fzf-maps-n)
xmap <leader><tab> <plug>(fzf-maps-x)
omap <leader><tab> <plug>(fzf-maps-o)

" Shortcuts
" nnoremap <Leader>o :Files<CR>
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>
vnoremap <C-s> <ESC>:w<CR>

nnoremap <Leader>s :w<CR>
inoremap <Leader>s <ESC>:w<CR>
vnoremap <Leader>s <ESC>:w<CR>

nnoremap <Leader>h :noh<CR>


map <Leader>G :Git 
" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

nnoremap <Space><Up>    :resize +2<CR>
nnoremap <Space><Down>  :resize -2<CR>
nnoremap <Space><Left>  :vertical resize +2<CR>
nnoremap <Space><Right> :vertical resize -2<CR>

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Startify
let g:startify_change_to_dir = 1
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

" Floaterm

hi Floaterm guibg=#424242
hi FloatermBorder guibg=#424242

nnoremap   <silent>   <F7>    :FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

command! LyGit FloatermNew lazygit 
nnoremap <leader>gi :FloatermNew lazygit<CR>

" Statusline config

function! GitStatusCount()
        if isdirectory(".git")
                " let l:count1 = substitute(system("git diff --numstat | wc -l"),'\n','','g')
                let l:count2 = substitute(system("git status --porcelain | wc -l"),'\n', '','g')
                if l:count2 == '0' 
                        return ''
                else        
                        return  l:count2 . "*"
                endif        
        else 
                return ''
        endif        
endfunction

" inoremap <silent><expr> <CR> compe#confirm('<CR>')
" inoremap <silent><expr> <CR> compe#confirm(luaeval("require 'nvim-autopairs'.autopairs_cr()"))
let delimitMate_expand_space = 1
inoremap <silent><expr> <CR>      compe#confirm({ 'keys': "\<Plug>delimitMateCR", 'mode': '' })
