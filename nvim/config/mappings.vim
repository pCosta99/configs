" Define leader key
if ! exists("mapleader")
  let mapleader = ","
endif

if ! exists("g:mapleader")
  let g:mapleader = ","
endif

" Upgraded ci
nnoremap ci( :call ChangeInsideSurroundings("(")
nnoremap ci) :call ChangeInsideSurroundings("(")
nnoremap ci[ :call ChangeInsideSurroundings("[")
nnoremap ci] :call ChangeInsideSurroundings("[")
nnoremap ci{ :call ChangeInsideSurroundings("{")
nnoremap ci} :call ChangeInsideSurroundings("{")
nnoremap ci< :call ChangeInsideSurroundings("<")
nnoremap ci> :call ChangeInsideSurroundings("<")

" Easier to leave insert mode
imap jj <Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Quick quit command
noremap <leader>q :quit<CR>
noremap <leader>Q :qa!<CR>

" Quick save command
noremap <leader>w :w<CR>
noremap <leader>wq :wq<CR>

" Source vimrc
noremap <leader>s :source $MYVIMRC<CR>

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
map <leader>t :tabnew %<CR>

" Delete buffer without closing split
nnoremap <leader>bd :bp\|bd #<CR>

" Kill the damned Ex mode.
nnoremap Q <nop>

" Learning the hard way.
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Open file prompt with current path
nmap <leader>e :e <C-R>=expand("%:p:h") . '/'<CR>

" Copy and paste to os clipboard
nmap <leader>y "*y
vmap <leader>y "*y
nmap <leader>d "*d
vmap <leader>d "*d
nmap <leader>p "*p
vmap <leader>p "*p

" Moving around, tabs, windows and buffers {{{
noremap <c-h> <c-w>h
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-l> <c-w>l

" Buffer related stuff
map <Leader>bl :ls<CR>

" Disable highlight when <leader><cr> is pressed
" but preserve cursor coloring
nmap <silent> <space> :noh<cr>
" }}}

" Spell checking {{{
" Pressing, ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" }}}

" Visual mode related {{{

" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" }}}

" Trouble plugin {{{
nnoremap <leader>xx <cmd>TroubleToggle<cr>
nnoremap <leader>xw <cmd>TroubleToggle lsp_workspace_diagnostics<cr>
nnoremap <leader>xd <cmd>TroubleToggle lsp_document_diagnostics<cr>
nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
nnoremap gR <cmd>TroubleToggle lsp_references<cr>
" }}}
