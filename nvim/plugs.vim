call plug#begin(stdpath('data') . '/plugged')
Plug 'tpope/vim-fugitive'
Plug 'airblade/vim-gitgutter'
" Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}

" General
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree' | 
        \ Plug 'Xuyuanp/nerdtree-git-plugin' 
" Plug 'ryanoasis/vim-devicons'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-dispatch'
" Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-commentary'
" Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-surround'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
" Plug 'jiangmiao/auto-pairs'
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
" Plug 'sheerun/vim-polyglot'
Plug 'voldikss/vim-floaterm'

if has("nvim")
  Plug 'APZelos/blamer.nvim'
  Plug 'hoob3rt/lualine.nvim'
  Plug 'kristijanhusak/defx-git'
  Plug 'kristijanhusak/defx-icons'
  Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'neovim/nvim-lspconfig'
  Plug 'kabouzeid/nvim-lspinstall'
  Plug 'glepnir/lspsaga.nvim'
  Plug 'folke/lsp-colors.nvim'
  Plug 'hrsh7th/nvim-compe'
  Plug 'hrsh7th/vim-vsnip'
  Plug 'rafamadriz/friendly-snippets'
  Plug 'mhartington/formatter.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
  " Plug 'windwp/nvim-autopairs'
  Plug 'JoosepAlviste/nvim-ts-context-commentstring'
  Plug 'kyazdani42/nvim-web-devicons'
  " Plug 'nvim-lua/popup.nvim'
  " Plug 'nvim-lua/plenary.nvim'
  " Plug 'nvim-telescope/telescope.nvim'
endif  

call plug#end()
