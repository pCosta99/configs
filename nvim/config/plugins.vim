call plug#begin('~/.config/nvim/plugged')

"Colorscheme
Plug 'patstockwell/vim-monokai-tasty'
Plug 'eddyekofo94/gruvbox-flat.nvim'

" Support bundles
Plug 'vim-scripts/gitignore'

" Bars, panels, and files
" Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim' " Fuzzy finder

" Text manipulation
Plug 'godlygeek/tabular'
Plug 'easymotion/vim-easymotion' " Worth learning
Plug 'ConradIrwin/vim-bracketed-paste'

" Allow pane movement to jump out of vim into tmux
Plug 'christoomey/vim-tmux-navigator'

" Haskell
" Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
" Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
" Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }

" Telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Trouble - Better bug displaying
Plug 'kyazdani42/nvim-web-devicons'
Plug 'folke/trouble.nvim'

" Elixir
Plug 'elixir-editors/vim-elixir'

" Comments
Plug 'preservim/nerdcommenter'

" Webdev
" Plug 'dense-analysis/ale'

" Neovim language servers
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'

" Autocomplete
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

" File management
" Plug 'kevinhwang91/rnvimr'
Plug 'vifm/vifm.vim'

" TreeSitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Which key
Plug 'liuchengxu/vim-which-key'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }

call plug#end()
