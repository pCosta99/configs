local lspconfig = require('lspconfig')
local capabilities = require("cmp_nvim_lsp").default_capabilities()

lspconfig.solargraph.setup({
  settings = {
    solargraph = {
      diagnostics = true,
      formatting = true,
    }
  },
  cmd = { "solargraph", "stdio" },
  capabilities = capabilities,
})

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
})

-- Keybindings for LSP
vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local opts = { buffer = ev.buf, noremap = true, silent = true }
    local function map(...)
      vim.keymap.set(...)
    end

    map("n", "gd", vim.lsp.buf.definition, opts)
    map("n", "K", vim.lsp.buf.hover, opts)
    map("n", "<leader>rn", vim.lsp.buf.rename, opts)
    map("n", "<leader>ca", vim.lsp.buf.code_action, opts)
    map('n', '<leader>de', vim.diagnostic.open_float, opts)
    map('n', '<leader>D', vim.lsp.buf.type_definition, opts)
    map("n", "df", vim.lsp.buf.format, opts)
    map("n", "gr", vim.lsp.buf.references, opts)
  end
})

-- Configure diagnostics settings for inline virtual text and gutter signs
vim.diagnostic.config({
  virtual_text = true,  -- Show diagnostics inline with the code
  signs = true,         -- Show error/warning signs in the gutter
  underline = true,     -- Underline the lines with diagnostics
  update_in_insert = false,  -- Don't update diagnostics while typing (optional)
})

-- Optional: Customize the colors of the diagnostics
vim.cmd([[highlight DiagnosticError guifg=#ff0000]])  -- Red for errors
vim.cmd([[highlight DiagnosticWarn guifg=#ff8800]])   -- Yellow for warnings
vim.cmd([[highlight DiagnosticInfo guifg=#0088ff]])   -- Blue for info
vim.cmd([[highlight DiagnosticHint guifg=#00ff00]])   -- Green for hints

vim.cmd("set completeopt=menu,menuone,noselect")

local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require('lspkind')

lspkind.init({
  symbol_map = {
    Copilot = "",
  },
})

vim.api.nvim_set_hl(0, "CmpItemKindCopilot", {fg ="#6CC644"})

require("luasnip.loaders.from_vscode").lazy_load()

local function check_trigger_completion()
  local col = vim.fn.col('.') - 1
  if col == 0 then return false end
  local line = vim.fn.getline('.')
  return line:sub(col, col):match("[%.:%w_]") ~= nil
end

local has_words_before = function()
  if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_text(0, line-1, 0, line-1, col, {})[1]:match("^%s*$") == nil
end

cmp.setup({
  enabled = true,
  debug = false,
  min_length = 1,
  preselect = "disabled",
  throttle_time = 80,
  source_timeout = 200,
  incomplete_delay = 400,
  max_abbr_width = 100,
  max_kind_width = 100,
  max_menu_width = 100,
  sorting = {
    comparators = {
      require("copilot_cmp.comparators").prioritize,
      cmp.config.compare.offset,
      cmp.config.compare.exact,
      cmp.config.compare.score,
      cmp.config.compare.kind,
      cmp.config.compare.sort_text,
      cmp.config.compare.length,
      cmp.config.compare.order,
    },
  },
  formatting = {
    format = lspkind.cmp_format({
      mode = 'symbol_text', -- Show both symbol and text (e.g., method and function name)
      maxwidth = 50, -- Limit the width of the completion items
    })
  },
  window = {
    documentation = {
      border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },  -- Add border configuration
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:CursorLine,Search:Search", -- Customize highlight groups
    },
  },
  completion = {
    autocomplete = { cmp.TriggerEvent.TextChanged },
  },
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- Use LuaSnip for snippets
    end,
  },
  mapping = {
    ["<Tab>"] = vim.schedule_wrap(function(fallback)
      if cmp.visible() and has_words_before() then
        cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
      else
        fallback()
      end
    end),

    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      end
    end, { "i", "s" }),
    ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    --['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ['<CR>'] = cmp.mapping.confirm({ select = true }),
  },
  sources = cmp.config.sources({
    { name = "copilot", group_index = 2 },
    { name = 'luasnip' },
    { name = 'nvim_lsp' },
    { name = 'treesitter' },
  }, {
    { name = 'buffer' },
    { name = 'path' }
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
