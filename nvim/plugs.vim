call plug#begin(stdpath('data') . '/plugged')
" Git
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'

" General
" Plug 'junegunn/fzf'
" Plug 'junegunn/fzf.vim'
" Plug 'preservim/nerdtree' | 
"         \ Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'Raimondi/delimitMate'
Plug 'Yggdroot/indentLine'

"Theme / Interface 
Plug 'ap/vim-buftabline'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'ghifarit53/tokyonight-vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'sainnhe/sonokai'

" Session
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-obsession'
Plug 'alvan/vim-closetag'
Plug 'voldikss/vim-floaterm'
 

call plug#end()
