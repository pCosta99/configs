-- Define leader key
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Upgraded ci (change inside surroundings)
local function change_inside_surroundings(char)
  vim.cmd("call ChangeInsideSurroundings('" .. char .. "')")
end

vim.api.nvim_set_keymap('n', 'ci(', ':lua change_inside_surroundings("(")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ci)', ':lua change_inside_surroundings(")")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ci[', ':lua change_inside_surroundings("[")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ci]', ':lua change_inside_surroundings("]")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ci{', ':lua change_inside_surroundings("{")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ci}', ':lua change_inside_surroundings("}")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ci<', ':lua change_inside_surroundings("<")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'ci>', ':lua change_inside_surroundings(">")<CR>', { noremap = true, silent = true })

-- Easier to leave insert mode
vim.api.nvim_set_keymap('i', 'jj', '<Esc>', { noremap = true, silent = true })

-- TAB in general mode will move to text buffer
vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true, silent = true })

-- Quick quit command
vim.api.nvim_set_keymap('n', '<leader>q', ':quit<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>Q', ':qa!<CR>', { noremap = true, silent = true })

-- Quick save command
vim.api.nvim_set_keymap('n', '<leader>w', ':w<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>wq', ':wq<CR>', { noremap = true, silent = true })

-- Source vimrc
vim.api.nvim_set_keymap('n', '<leader>s', ':source $MYVIMRC<CR>', { noremap = true, silent = true })

-- Scrolling tabs
for i = 1, 9 do
  vim.api.nvim_set_keymap('n', '<leader>'..i, i..'gt', { noremap = true, silent = true })
end
vim.api.nvim_set_keymap('n', '<leader>0', '10gt', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>t', ':tabnew %<CR>', { noremap = true, silent = true })

-- Delete buffer without closing split
vim.api.nvim_set_keymap('n', '<leader>bd', ':bp|bd #<CR>', { noremap = true, silent = true })

-- Kill the damned Ex mode.
vim.api.nvim_set_keymap('n', 'Q', '<nop>', { noremap = true, silent = true })

-- Learning the hard way.
vim.api.nvim_set_keymap('n', '<Up>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Down>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Left>', '<Nop>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Right>', '<Nop>', { noremap = true, silent = true })

-- Open file prompt with current path
vim.api.nvim_set_keymap('n', '<leader>e', ':e <C-R>=expand("%:p:h") . \'/\'<CR>', { noremap = true, silent = true })

-- Copy and paste to os clipboard
vim.api.nvim_set_keymap('n', '<leader>y', '"*y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>y', '"*y', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>d', '"*d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>d', '"*d', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>p', '"*p', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<leader>p', '"*p', { noremap = true, silent = true })

-- Moving around, tabs, windows and buffers
vim.api.nvim_set_keymap('n', '<c-h>', '<c-w>h', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-k>', '<c-w>k', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-j>', '<c-w>j', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<c-l>', '<c-w>l', { noremap = true, silent = true })

-- Disable highlight when <leader><cr> is pressed but preserve cursor coloring
vim.keymap.set("n", "<space>", function()
  vim.cmd("noh")
  vim.cmd("NoiceDismiss")
end, { noremap = true, silent = true })

-- Visual mode related
vim.api.nvim_set_keymap('v', '<silent> *', ':call VisualSelection("f", "")<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', '<silent> #', ':call VisualSelection("b", "")<CR>', { noremap = true, silent = true })
