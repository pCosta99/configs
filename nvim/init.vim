source $HOME/.config/nvim/config/settings.vim
source $HOME/.config/nvim/config/mappings.vim
source $HOME/.config/nvim/config/plugin_config.vim

" Track current directory
"autocmd BufEnter * silent! lcd %:p:h

lua require('plugins')
lua require('treesitter')
lua require('lsp_config')
lua require('nvimtree')
lua require('colors')

lua require('nvim-autopairs').setup{}
nnoremap <leader>a mF:%!eslint_d --stdin --fix-to-stdout --stdin-filename %<CR>`F
