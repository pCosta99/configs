-- Trouble plugin
vim.api.nvim_set_keymap('n', '<leader>xx', '<cmd>Trouble diagnostics toggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xq', '<cmd>Trouble qflist toggle<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>xl', '<cmd>Trouble loclist toggle<cr>', { noremap = true, silent = true })
