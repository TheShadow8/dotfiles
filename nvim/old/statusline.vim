function! CocCurrentFunction()
    return get(b:, 'coc_current_function', '')
endfunction

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

function! GitStatus()
  let [a,m,r] = GitGutterGetHunkSummary()
  return printf('+%d ~%d -%d', a, m, r)
endfunction

let g:lightline = {
      \ 'colorscheme': 'deus',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gst','gitbranch','gstc'], 
      \             [ 'filename', 'modified' ],
      \             ['cocstatus', 'currentfunction'] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status',
      \   'currentfunction': 'CocCurrentFunction',
      \   'gitbranch': 'FugitiveHead',
      \   'readonly': 'LightlineReadonly',
      \   'gst': 'GitStatus',
      \   'gstc': 'GitStatusCount',
        \ },
      \ }


" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" let g:airline_theme = 'nord'
" let g:airline#extensions#tabline#enabled = 1
" let g:airline#extensions#tabline#buffer_nr_show = 1
" function! AirlineInit()
  " call airline#parts#define_raw('gstc', '%{GitStatusCount()}')
  " call airline#parts#define_raw('ccf', '%{CocCurrentFunction()}')
  " let g:airline_section_b = airline#section#create(['hunks', 'branch', 'gstc', ''])
" endfunction
" autocmd VimEnter * call AirlineInit()

