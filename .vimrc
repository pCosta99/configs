syntax on
set nocompatible              " be iMproved, required
filetype off "plugin indent on required

let mapleader=","

set rtp+=~/.vim/bundle/Vundle.vim

"Pathogen
execute pathogen#infect('~/.vim/bundle/pathogen/{}')

call vundle#begin()

"let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

"Syntastic
Plugin 'vim-syntastic/syntastic'

"Displays which mode you are on
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

"GODS PLUGIN
Plugin 'tpope/vim-surround'
Plugin 'cohama/lexima.vim'

"NerdTree
Plugin 'scrooloose/nerdtree'
Plugin 'powerline/fonts'

"NerdCommenter
Plugin 'preservim/nerdcommenter'

call vundle#end()

call plug#begin('~/.vim/plugged')
Plug 'patstockwell/vim-monokai-tasty'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"colorschemes
Plug 'ParamagicDev/vim-medic_chalk'
Plug 'wdhg/dragon-energy'
call plug#end()

let g:vim_monokai_tasty_italic = 1                    " allow italics, set this before the colorscheme
colorscheme vim-monokai-tasty

" Show line number
set number
set rnu

" Tab space e shift width
set ts=4
set shiftwidth=4

" Show brace match
set showmatch

" disable backup and swap files
set nobackup
set nowritebackup
set noswapfile

set expandtab                   " Expand tabs to spaces
set autoindent smartindent      " auto/smart indent
set copyindent                  " copy previous indentation on auto indent

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

"Airline config
let g:airline_theme='deus'
let g:airline_powerline_fonts = 1
let g:airline_section_z=''
let g:airline_section_error=''
let g:airline_section_warning=''
let g:airline_section_gutter=''
let g:airline_skip_empty_sections = 1
let g:airline_section_x=''
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_count = 0
let g:airline#extensions#tabline#formatter = 'unique_tail'
let g:bufferline_echo = 0
let g:airline#extensions#tabline#tab_nr_type = 1

"Syntastic config
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_error_symbol = "✗"
let g:syntastic_loc_list_height=5
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
map <leader>w :SyntasticCheck<CR>
map <leader>e :SyntasticReset<CR>
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes': [],'passive_filetypes': [] }
nnoremap <C-w>E :SyntasticCheck<CR> :SyntasticToggleMode<CR>

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

"  Scrolling tabs
map <leader>1 1gt
map <leader>2 2gt
map <leader>3 3gt
map <leader>4 4gt
map <leader>5 5gt
map <leader>6 6gt
map <leader>7 7gt
map <leader>8 8gt
map <leader>9 9gt
map <leader>0 10gt
map <leader>t :tabnew<CR>

" move left and right
nnoremap <leader>l :tabm -1<CR>
nnoremap <leader>r :tabm +1<CR>

" move to specified tab
nnoremap <leader>m0 :tabm 0<CR>
nnoremap <leader>m1 :tabm 1<CR>
nnoremap <leader>m2 :tabm 2<CR>
nnoremap <leader>m3 :tabm 3<CR>
nnoremap <leader>m4 :tabm 4<CR>
nnoremap <leader>m5 :tabm 5<CR>
nnoremap <leader>m6 :tabm 6<CR>
nnoremap <leader>m7 :tabm 7<CR>
nnoremap <leader>m8 :tabm 8<CR>
nnoremap <leader>m9 :tabm 9<CR>

" NerdTree
map <C-z> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"clear highlights with ctrl-L
map <C-l> :noh<CR>

"Display hidden files in NerdTree
let NERDTreeShowHidden=1

"Surround
nmap <leader>a ysiw
