-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use "EdenEast/nightfox.nvim"
  use ("nvim-treesitter/nvim-treesitter", {run = ':TSUpdate'})
  use "theprimeagen/harpoon"
  use "mbbill/undotree"
  use {
  'VonHeikemen/lsp-zero.nvim',
  requires = {
    -- LSP Support
    -- Mason is used for lsp packages :help mason.nvim
    {'neovim/nvim-lspconfig'},
    {'williamboman/mason.nvim'},
    {'williamboman/mason-lspconfig.nvim'},

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    {'saadparwaiz1/cmp_luasnip'},
    {'hrsh7th/cmp-nvim-lsp'},
    {'hrsh7th/cmp-nvim-lua'},

    -- Snippets
    {'L3MON4D3/LuaSnip'},
    -- Snippet Collection (Optional)
    {'rafamadriz/friendly-snippets'},
  }
}
  -- null-ls for black lsp linting and formatting
  use "jose-elias-alvarez/null-ls.nvim"
  use "github/copilot.vim"

  end)