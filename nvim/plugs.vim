call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
" Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'airblade/vim-gitgutter'
Plug 'APZelos/blamer.nvim'

" General
Plug 'mileszs/ack.vim'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree' | 
        \ Plug 'Xuyuanp/nerdtree-git-plugin' 
Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'neoclide/coc.nvim', { 'branch': 'release' }
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
Plug 'Yggdroot/indentLine'
"Theme / Interface 
" Plug 'itchyny/lightline.vim'
Plug 'ap/vim-buftabline'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'morhetz/gruvbox'
Plug 'mhartington/oceanic-next'
Plug 'othree/html5.vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'ayu-theme/ayu-vim'
Plug 'joshdick/onedark.vim'
Plug 'tomasiser/vim-code-dark'
Plug 'ghifarit53/tokyonight-vim'
Plug 'lifepillar/vim-gruvbox8'

" Session
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-obsession'
Plug 'alvan/vim-closetag'
Plug 'sheerun/vim-polyglot'
Plug 'voldikss/vim-floaterm'

" Snippet
Plug 'honza/vim-snippets'

if has("nvim")
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  " Plug 'nvim-lua/completion-nvim'
  Plug 'hrsh7th/nvim-compe'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'mhartington/formatter.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  Plug 'kyazdani42/nvim-web-devicons'
endif  

call plug#end()
