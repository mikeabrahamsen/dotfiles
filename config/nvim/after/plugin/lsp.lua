-- Learn the keybindings, see :help lsp-zero-keybindings
-- Learn to configure LSP servers, see :help lsp-zero-api-showcase
local lsp = require('lsp-zero')
lsp.preset('recommended')

lsp.configure('pylsp', {
  settings = {
    pylsp = {
      plugins = {
        pycodestyle = {
          ignore = {'W391'},
          maxLineLength = 100
       },
      }
    }
  }
})

local cmp = require('cmp')
local cmp_action = require('lsp-zero').cmp_action()
local cmp_select = {behavior = cmp.SelectBehavior.Select}
local cmp_format = require('lsp-zero').cmp_format()

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
      ['<C-f>'] = cmp_action.luasnip_jump_forward(),
      ['<C-b>'] = cmp_action.luasnip_jump_backward(),

      -- Scroll up and down in the completion documentation
      ['<C-u>'] = cmp.mapping.scroll_docs(-4),
      ['<C-d>'] = cmp.mapping.scroll_docs(4),

      -- disable completion with tab
      -- this helps with copilot setup
      ['<Tab>'] = nil,
      ['<S-Tab>'] = nil,
  }),
  formatting = cmp_format,
  window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
  }
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = 'E',
        warn = 'W',
        hint = 'H',
        info = 'I'
    }
})

lsp.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}

  if client.name == "eslint" then
      vim.cmd.LspStop('eslint')
      return
  end

  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
  -- vim.keymap.set("n", "<leader>vws", vim.lsp.buf.workspace_symbol, opts)
  -- vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, opts)
  -- vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  -- vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
  -- vim.keymap.set("n", "<leader>vca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>ag", vim.lsp.buf.references, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
end)

lsp.setup()

-- null-ls for black formatting python ---
local null_ls = require('null-ls')
local null_opts = lsp.build_options('null-ls', {})

null_ls.setup({
  on_attach = function(client, bufnr)
    null_opts.on_attach(client, bufnr)
    --- you can add more stuff here if you need it
  end,
  sources = {
    null_ls.builtins.formatting.black,
  }
})

vim.diagnostic.config({
    virtual_text = true,
})
