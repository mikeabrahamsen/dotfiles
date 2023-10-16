-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }

        vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
        vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
        vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
        vim.keymap.set("n", "<leader>ag", vim.lsp.buf.references, opts)
        vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
    end,
})
local lspconfig = require('lspconfig')
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()

require('mason').setup()
require('mason-lspconfig').setup({
  ensure_installed = {
    'pylsp',
  }
})

require('mason-lspconfig').setup_handlers({
  function(server_name)
    lspconfig[server_name].setup({
      capabilities = lsp_capabilities,
    })
  end,
})

-- Pylsp config after setup
require'lspconfig'.pylsp.setup{
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
        }
      }
    }
  }
}


local cmp = require('cmp')
local cmp_select = {behavior = cmp.SelectBehavior.Select}

-- Add completion source from friendly-snippets
require("luasnip.loaders.from_vscode").lazy_load()

cmp.setup({
  mapping = cmp.mapping.preset.insert({
      -- `Enter` key to confirm completion
      ['<CR>'] = cmp.mapping.confirm({select = false}),

      ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
      ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
      ['<C-y>'] = cmp.mapping.confirm({ select = true }),
      -- Ctrl+Space to trigger completion menu
      ["<C-Space>"] = cmp.mapping.complete(),

      -- Navigate between snippet placeholder
      -- ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      -- ['<C-b>'] = cmp_action.luasnip_jump_backward(),

      -- Scroll up and down in the completion documentation
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),

      -- disable completion with tab
      -- this helps with copilot setup
      ['<Tab>'] = nil,
      ['<S-Tab>'] = nil,
  }),
  -- formatting = cmp_format,
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  }
})
