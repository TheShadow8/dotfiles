"NERD Tree
let g:NERDTreeGitStatusWihFlags = 1
let g:NERDTreeGitStatusUseNerdFonts = 1

let NERDTreeShowHidden=1
let g:NERDTreeIgnore = ['^node_modules$', '.DS_Store']
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
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
"
autocmd BufRead * call SyncTree()
" autocmd BufWinEnter * call SyncTree()
command! -nargs=0 SyncTree :call SyncTree()
"
" let g:plug_window = 'noautocmd vertical topleft new'

map <A-t> :NERDTreeToggle<CR>
map <Leader>n :NERDTreeFocus<CR>
