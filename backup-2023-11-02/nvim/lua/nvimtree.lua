local tree_cb = require'nvim-tree.config'.nvim_tree_callback
-- default mappings
local list = {
  { key = {"<CR>", "o", "<2-LeftMouse>", "l"}, cb = tree_cb("edit") },
}

require'nvim-tree'.setup {
  hijack_cursor = true,
  -- Open on current buffer
  update_focused_file = {
    enable = true,
    update_cwd = true,
  },
  view = {
    mappings = {
      list = list
    }
  }
}
