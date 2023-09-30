local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)


require("lazy").setup({
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    {"EdenEast/nightfox.nvim"},
    {"mbbill/undotree"},
    {'nvim-telescope/telescope.nvim', tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim' }
    },
    -- LSP Support
    {'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/nvim-cmp'},
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    -- Autocomplete
    {
        'hrsh7th/nvim-cmp',
        config = function ()
            require'cmp'.setup {
                snippet = {
                    expand = function(args)
                        require'luasnip'.lsp_expand(args.body)
                    end
                },

                sources = {
                    {name = 'luasnip'},
                    {name = 'nvim_lsp'},
                    -- more sources
                },
            }
        end
    },
    --{'hrsh7th/nvim-cmp'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lua'},
    {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
    },
    -- null-ls for black lsp linting and formatting
    {'jose-elias-alvarez/null-ls.nvim'},
    {'github/copilot.vim'},
    -- maby use neovim black for async
    {'psf/black', branch = 'stable' },

    -- for fun
    {'eandrju/cellular-automaton.nvim'}
})
