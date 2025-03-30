vim.o.background="dark"
vim.opt.termguicolors = true

vim.cmd([[
" If you have vim >=8.0 or Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

set termguicolors

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Theme
syntax enable
syntax on

" colorscheme gruvbox-flat
" colorscheme tender
colorscheme tokyonight-moon
]])
