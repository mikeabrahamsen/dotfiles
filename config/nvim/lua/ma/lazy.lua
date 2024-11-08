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
    {'nvim-telescope/telescope.nvim',
    dependencies = { 
        'nvim-lua/plenary.nvim', 
        'mollerhoj/telescope-recent-files.nvim', 
        },
    config = function()
        require("telescope").load_extension("recent-files")
    end
    },
    {
        "FabijanZulj/blame.nvim",
        config = function()
            require('blame').setup {}
        end,
    },

    -- LSP Support
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},
    -- Autocomplete
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'hrsh7th/cmp-nvim-lua'},
    -- for fun
    {'eandrju/cellular-automaton.nvim'},

    -- AI tools
    {'github/copilot.vim', enabled = false},
    {"supermaven-inc/supermaven-nvim"},

    -- typescript tools
    {
    "pmizio/typescript-tools.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
    opts = {},
    }
})
