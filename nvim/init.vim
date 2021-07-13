set encoding=utf8
set nocompatible              " be iMproved, required
filetype on " required
filetype plugin indent on    " required
set number relativenumber
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
let mapleader=";"
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
" configure title to look like: Vim /path/to/file

" Always display the status line
set laststatus=2

" set termwinsize=15x0
set hidden
set updatetime=300

set smartcase " Auto switch to case sensitive when Upper-case use (exp: Search ...)
set colorcolumn=80
set termguicolors     " enable true colors support (24 bit colors) let g:go_def_mapping_enabled = 0
call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'airblade/vim-gitgutter'

" General
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree' | 
        \ Plug 'Xuyuanp/nerdtree-git-plugin' |
         \ Plug 'ryanoasis/vim-devicons'

Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'neoclide/coc.nvim', { 'branch': 'release' }
Plug 'ervandew/supertab'
Plug 'tpope/vim-dispatch'
Plug 'tomtom/tcomment_vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'pangloss/vim-javascript'
Plug 'tpope/vim-surround'
Plug 'ap/vim-css-color'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'jiangmiao/auto-pairs'

"Theme / Interface 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'othree/html5.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

" Session
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-obsession'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'voldikss/vim-floaterm'

" Snippet
Plug 'honza/vim-snippets'
call plug#end()
"============Configuration===========================================
set titlestring=%t%(\ %M%)%(\ (%{expand(\"%:~:.:h\")})%)%(\ %a%)
let g:go_build_tags = 'wireinject'
" Re-map
" command maps{{{
" cnoremap jk <c-c>
"}}}
inoremap jj <ESC>
let g:go_def_mapping_enabled = 0

inoremap <leader>dd <Esc>ddi
inoremap <leader>> <esc>>>a
inoremap <leader>< <esc><<a
vnoremap < <gv
vnoremap > >gv

" Go highlight
let g:go_highlight_structs = 1 
let g:go_highlight_methods = 1
let g:go_highlight_functions = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1
let g:go_highlight_types = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_fields = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_generate_tags = 1
" let g:go_highlight_function_parameters = 1
" let g:go_highlight_variable_declarations = 1
" let g:go_highlight_variable_assignments = 1

" Move a line down/up
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
inoremap <A-j> <Esc>:m .+1<CR>==gi
inoremap <A-k> <Esc>:m .-2<CR>==gi
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

set background=dark
let g:floaterm_width=0.9
let g:floaterm_height=0.9
let ayucolor="mirage" " dark, mirage, light for mirage version of theme
" colorscheme ayu " gruvbox, codedark, ayu
" colorscheme dracula " gruvbox, codedark, ayu
" colorscheme molokai " gruvbox, codedark, ayu
colorscheme onedark " gruvbox, codedark, ayu
" colorscheme codedark  " gruvbox, codedark, ayu

let g:molokai_original = 0
let g:spacegray_underline_search = 1
let g:spacegray_italicize_comments = 1
" let g:airline_theme = 'nord'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1
nnoremap <A-Left> :bprev<CR>
nnoremap <A-Right> :bnext<CR>


"NERD Tree
let g:NERDTreeGitStatusWihFlags = 1
" let g:NERDTreeGitStatusUseNerdFonts = 1

let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$']
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree
autocmd BufRead * call SyncTree()
autocmd BufWinEnter * call SyncTree()
command! -nargs=0 SyncTree :call SyncTree()
let g:plug_window = 'noautocmd vertical topleft new'

" Git Gutter
nmap ]h <Plug>(GitGutterNextHunk)
nmap [h <Plug>(GitGutterPrevHunk)
highlight GitGutterAdd    guifg=#009900 ctermfg=2
highlight GitGutterChange guifg=#bbbb00 ctermfg=3
highlight GitGutterDelete guifg=#ff2222 ctermfg=1

" Devicons configuration 
" let g:webdevicons_conceal_nerdtree_brackets = 1
" let g:WebDevgruvboxrdTreeAfterGlyphPadding = ''
" let g:WebDevIconsUnicodeDecorateFolderNodes = 0

" Coc config
" coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-html',
  \ 'coc-json',
  \ 'coc-tslint-plugin',
  \ 'coc-css',
  \ 'coc-go',
  \ 'coc-cssmodules',
  \ 'coc-angular',
  \ ]
  
" vim-prettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
command! -nargs=0 Prettier :CocCommand prettier.formatFile
" run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

inoremap <silent><expr> <c-j> coc#util#has_float() ? coc#util#float_scroll_i( 1) : "\<c-j>"
inoremap <silent><expr> <c-k> coc#util#has_float() ? coc#util#float_scroll_i(-1) : "\<c-k>"
vnoremap <silent><expr> <c-j> coc#util#has_float() ? coc#util#float_scroll_i( 1) : "\<c-j>"
vnoremap <silent><expr> <c-k> coc#util#has_float() ? coc#util#float_scroll_i(-1) : "\<c-k>"

"use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()
" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd  <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nnoremap <silent><leader>xgr  :<C-u>call CocAction('jumpReferences', 'split')<CR>
nnoremap <silent><leader>vgr  :<C-u>call CocAction('jumpReferences', 'vsplit')<CR>
" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
" Remap for rename current word
nmap <F2> <Plug>(coc-rename)
nmap <silent>rn (coc-rename)
" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

autocmd BufWritePre *.go,*.ts,*.tsx,*.css,*.scss :call CocAction('runCommand', 'editor.action.organizeImport')

function! GitStatusCount()
        if isdirectory(".git")
                return substitute(system("git diff --numstat | wc -l"), "\n", "","g")
        else 
                return ''
        endif        
endfunction

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}
let g:airline_section_y = '!%{GitStatusCount()} '

" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

""""""""""""""""""END coc config=====================

" Fzf Configuration
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
let g:fzf_tags_command = 'ctags -R'
" Border color
let g:fzf_layout = {'up':'~90%', 'window': { 'width': 0.8, 'height': 0.8,'yoffset':0.5,'xoffset': 0.5, 'highlight': 'Todo', 'border': 'sharp' } }
let g:fzf_history_dir = '~/.local/share/fzf-history'
" Enable Elite mode, No ARRRROWWS!!!!
let g:elite_mode=1
let $FZF_DEFAULT_OPTS = '--layout=reverse --info=inline --preview "bat --theme="gruvbox-light" --style=numbers,changes --color always"'
let $FZF_DEFAULT_COMMAND="rg --files --hidden"

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

"Get Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview({'options': ['--layout=reverse', '--info=inline']}), <bang>0)

function! Get_visual_selection()
    " Why is this not a built-in Vim script function?!
    let [line_start, column_start] = getpos("'<")[1:2]
    let [line_end, column_end] = getpos("'>")[1:2]
    let lines = getline(line_start, line_end)
    if len(lines) == 0
        return ''
    endif
    let lines[-1] = lines[-1][: column_end - (&selection == 'inclusive' ? 1 : 2)]
    let lines[0] = lines[0][column_start - 1:]
    return join(lines, "\n")
endfunction


" Get text in files with Rg
command! -bang -nargs=* Rg
  \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)


" Ripgrep advanced
function! RipgrepFzf(query, fullscreen)
  let command_fmt = 'rg --column --line-number --no-heading --color=always --smart-case %s || true'
  let initial_command = printf(command_fmt, shellescape(a:query))
  let reload_command = printf(command_fmt, '{q}')
  let spec = {'options': ['--phony', '--query', a:query, '--bind', 'change:reload:'.reload_command]}
  call fzf#vim#grep(initial_command, 1, fzf#vim#with_preview(spec), a:fullscreen)
endfunction


command! -nargs=* -bang RG call RipgrepFzf(<q-args>, <bang>1)

" Git grep command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   fzf#vim#with_preview({'dir': systemlist('git rev-parse --show-toplevel')[0]}), <bang>0)

vnoremap <C-f> :call RipgrepFzf(Get_visual_selection(), 1)<CR>
nnoremap <C-f> :call RipgrepFzf(expand("<cword>"), 1)<CR>
inoremap <C-f> <ESC>: call RipgrepFzf(expand("<cword>"), 1)<CR>

"================Mapping configuration===============
map <A-t> :NERDTreeToggle<CR>
map <leader>n :NERDTreeFocus<CR>
map <C-p> :Files<CR>

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
nnoremap <Leader>o :Files<CR>
nnoremap <C-s> :w<CR>
nnoremap <Leader>h :noh<CR>

" Insert mode completion
imap <c-x><c-k> <plug>(fzf-complete-word)
imap <c-x><c-f> <plug>(fzf-complete-path)
imap <c-x><c-j> <plug>(fzf-complete-file-ag)
imap <c-x><c-l> <plug>(fzf-complete-line)

if get(g:, 'elite_mode')
	nnoremap <Space><Up>    :resize +2<CR>
	nnoremap <Space><Down>  :resize -2<CR>
	nnoremap <Space><Left>  :vertical resize +2<CR>
	nnoremap <Space><Right> :vertical resize -2<CR>
endif

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

let g:startify_lists = [
          \ { 'type': 'files',     'header': ['   Files']            },
          \ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ { 'type': 'sessions',  'header': ['   Sessions']       },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
          \ ]

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
