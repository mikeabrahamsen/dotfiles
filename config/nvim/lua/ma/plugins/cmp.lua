return {
    'hrsh7th/nvim-cmp',
    dependencies = {
        'hrsh7th/cmp-nvim-lsp',
        'hrsh7th/cmp-buffer',
        'hrsh7th/cmp-path',
        'hrsh7th/cmp-cmdline',
        'hrsh7th/cmp-nvim-lua',
        'onsails/lspkind.nvim',
    },
    config = function()
        local cmp = require('cmp')
        local lspkind = require('lspkind')

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
                ['<Tab>'] = nil,
                ['<S-Tab>'] = nil,
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
            },
            formatting = {
                format = lspkind.cmp_format({
                    mode = 'symbol', -- Show only symbol annotations
                    maxwidth = 50, -- Prevent the popup from showing more than 50 characters
                    symbol_map = { Supermaven = "" },
                    ellipsis_char = '...', -- Truncate with ellipsis
                    before = function(entry, vim_item)
                        -- Modify vim_item if needed
                        return vim_item
                    end,
                }),
            },
            -- Add more nvim-cmp configurations as necessary
        })
    end,
}
