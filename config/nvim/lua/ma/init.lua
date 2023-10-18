require("ma.remap")
require("ma.lazy")
require("ma.set")
require("mason").setup()

vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- Trim trailing whitespace before saving
vim.cmd([[
  augroup TrimWhitespace
    autocmd!
    autocmd BufWritePre *.py let g:save_cursor = winsaveview() | %s/\s\+$//e | call winrestview(g:save_cursor)
  augroup END
]])
