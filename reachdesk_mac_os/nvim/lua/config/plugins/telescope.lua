-- Telescope key mappings
vim.api.nvim_set_keymap('n', '<leader>tf', '<cmd>lua require("telescope.builtin").find_files()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tg', '<cmd>lua require("telescope.builtin").live_grep()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>tb', '<cmd>lua require("telescope.builtin").buffers()<cr>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>th', '<cmd>lua require("telescope.builtin").help_tags()<cr>', { noremap = true, silent = true })
