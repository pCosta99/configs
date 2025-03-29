vim.cmd([[
call plug#begin('~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-treesitter/nvim-treesitter'

" Completion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'

Plug 'sheerun/vim-polyglot'

"Git
Plug 'f-person/git-blame.nvim'

" For vsnip users.
Plug 'hrsh7th/cmp-vsnip'
Plug 'hrsh7th/vim-vsnip'

" Colorscheme
Plug 'eddyekofo94/gruvbox-flat.nvim'
Plug 'kyoz/purify', { 'rtp': 'vim' }
Plug 'jacoborus/tender.vim'
Plug 'kartikp10/noctis.nvim'
Plug 'rktjmp/lush.nvim'

" Extras
Plug 'christoomey/vim-tmux-navigator'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'windwp/nvim-autopairs'

" File tree
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Status Line
Plug 'nvim-lualine/lualine.nvim'

" Comments
Plug 'preservim/nerdcommenter'

" Markdown
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }

Plug 'tpope/vim-abolish'
Plug 'github/copilot.vim'
call plug#end()
]])
