-- General Settings {{{

-- Automatically delete all trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  command = "%s/\\s\\+$//e",
})

-- Use indentation for folds
vim.o.foldmethod = 'indent'
vim.o.foldnestmax = 5
vim.o.foldlevelstart = 99
vim.o.foldcolumn = '0'

-- Clipboard
vim.o.clipboard = 'unnamedplus'

-- Scrolling
vim.o.scrolloff = 10

-- Fold vimrc itself by categories
vim.api.nvim_create_augroup("vimrcFold", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = "vimrcFold",
  pattern = "vim",
  command = "set foldmethod=marker",
})
vim.api.nvim_create_autocmd("FileType", {
  group = "vimrcFold",
  pattern = "vim",
  command = "set foldlevel=0",
})

-- History
vim.o.history = 700

-- Auto-read when file is changed externally
vim.o.autoread = true

-- Leader key timeout
vim.o.timeoutlen = 500

-- Allow the normal use of "," by pressing it twice
vim.api.nvim_set_keymap('n', ',,', ',', { noremap = true, silent = true })

-- Use `par` for prettier line formatting
vim.o.formatprg = 'par'
vim.env.PARINIT = 'rTbgqR B=.,?_A_a Q=_s>|'

-- }}}

-- Vim User Interface {{{

-- Set 7 lines to the cursor when moving vertically using j/k
vim.o.scrolloff = 7

-- Enable the wildmenu
vim.o.wildmenu = true
vim.o.wildmode = 'list:longest,full'

-- Always show current position
vim.o.ruler = true
vim.o.number = true
vim.o.relativenumber = true

-- Show trailing whitespace
vim.o.list = true
if vim.o.listchars == 'eol:$' then
  vim.o.listchars = 'tab:> ,trail:-,extends:>,precedes:<,nbsp:+'
end

-- Height of the command bar
vim.o.cmdheight = 1

-- Configure backspace behavior
vim.o.backspace = 'eol,start,indent'
vim.o.whichwrap = vim.o.whichwrap .. ',<,>,h,l'

-- Ignore case when searching
vim.o.ignorecase = true

-- When searching, try to be smart about cases
vim.o.smartcase = true

-- Highlight search results
vim.o.hlsearch = true

-- Make search act like search in modern browsers
vim.o.incsearch = true

-- Turn magic on for regular expressions
vim.o.magic = true

-- Show matching brackets when the cursor is over them
vim.o.showmatch = true

-- How many tenths of a second to blink when matching brackets
vim.o.mat = 2

-- No annoying sound on errors
vim.o.vb = true

-- Disable mouse
vim.o.mouse = ""

-- }}}

-- Files, Backups, and Undo {{{

-- Turn backup off
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

-- Source the vimrc file after saving it
vim.api.nvim_create_augroup("sourcing", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  group = "sourcing",
  pattern = "init.vim",
  callback = function()
    vim.cmd("source $MYVIMRC")
  end
})

-- }}}

-- Text, Tab, and Indent Settings {{{

-- Treat dash-separated words as a word text object
-- vim.o.iskeyword = vim.o.iskeyword .. "-"

-- Use spaces instead of tabs
vim.o.expandtab = true

-- Set 1 tab == 2 spaces
vim.o.shiftwidth = 2
vim.o.softtabstop = 2
vim.o.tabstop = 2

-- Linebreak at 500 characters
vim.o.linebreak = true
vim.o.textwidth = 500

-- Auto indent, smart indent, and wrap lines
vim.o.ai = true  -- Auto indent
vim.o.si = true  -- Smart indent
vim.o.wrap = true  -- Wrap lines

-- }}}

-- Moving Around, Tabs, Windows, and Buffers {{{

-- Return to last edit position when opening files
vim.api.nvim_create_augroup("last_edit", { clear = true })
vim.api.nvim_create_autocmd("BufReadPost", {
  group = "last_edit",
  pattern = "*",
  callback = function()
    if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
      vim.cmd("normal! g`\"")
    end
  end
})

-- Remember info about open buffers on close
-- vim.o.viminfo = vim.o.viminfo .. "%"

-- Don't close buffers when you aren't displaying them
vim.o.hidden = true

-- }}}

-- Status Line {{{

-- Always show the status line
vim.o.laststatus = 2

-- }}}
