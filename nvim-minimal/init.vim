source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/plugin_config.vim

lua require('plugins')
lua require('treesitter')
lua require('lsp_config')
lua require('nvimtree')
lua require('colors')
