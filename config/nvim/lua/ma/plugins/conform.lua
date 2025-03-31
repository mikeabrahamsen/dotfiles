return {
  'stevearc/conform.nvim',
    config = function()
        require("conform").setup({
        formatters_by_ft = {
            python = { "isort", "black" },
        },
        formatters = {
            black = {
            prepend_args = {
                "--line-length", "88", 
                "--skip-string-normalization" 
                },
            },
        },
        format_on_save = {
            lsp_fallback = true,
            timeout_ms = 2000,
        },
        })
    end,
  opts = {},
}
