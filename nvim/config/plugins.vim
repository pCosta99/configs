call plug#begin('~/.config/nvim/plugged')

"Colorscheme
Plug 'patstockwell/vim-monokai-tasty'

" Support bundles
Plug 'vim-scripts/gitignore'

" Git
Plug 'tpope/vim-fugitive'
Plug 'int3/vim-extradite'

" Bars, panels, and files
Plug 'scrooloose/nerdtree'
Plug 'itchyny/lightline.vim'
Plug 'ctrlpvim/ctrlp.vim'

" Text manipulation
Plug 'vim-scripts/Align'
Plug 'simnalamburt/vim-mundo'
Plug 'godlygeek/tabular'
Plug 'michaeljsmith/vim-indent-object'
Plug 'easymotion/vim-easymotion'
Plug 'ConradIrwin/vim-bracketed-paste'

" Allow pane movement to jump out of vim into tmux
Plug 'christoomey/vim-tmux-navigator'

" Haskell
Plug 'neovimhaskell/haskell-vim', { 'for': 'haskell' }
Plug 'enomsg/vim-haskellConcealPlus', { 'for': 'haskell' }
Plug 'mpickering/hlint-refactor-vim', { 'for': 'haskell' }

"Elixir
Plug 'elixir-editors/vim-elixir'

" Comments
Plug 'preservim/nerdcommenter'

" Webdev
Plug 'dense-analysis/ale'

" Neovim language servers
Plug 'neovim/nvim-lspconfig'

" Autocomplete
Plug 'hrsh7th/nvim-compe'
Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

call plug#end()