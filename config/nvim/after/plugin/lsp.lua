local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

cmp.setup({
  mapping = cmp.mapping.preset.insert({
      -- `Enter` key to confirm completion
      ['<CR>'] = cmp.mapping.confirm({select = false}),

      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      ['<Tab>'] = cmp.mapping.confirm({ select = true }),

      -- Scroll up and down in the completion documentation
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),

      -- disable completion with tab
      -- this helps with copilot setup
      -- ['<Tab>'] = nil,
      -- ['<S-Tab>'] = nil,
  }),
  sources = {
    { name = "supermaven" },
    { name = 'nvim_lsp' },
    { name = 'path' },
    { name = 'buffer' },
  },
  -- formatting = cmp_format,
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  }
})
