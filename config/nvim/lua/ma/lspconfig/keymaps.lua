local M = {}

M.setup = function (_, bufnr)
    local opts = {noremap = true, silent = true}
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = true, desc = 'Go To Definition' })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buffer = true, desc = 'Go To Declaration' })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = true, desc = 'Hover Lookup' })
    vim.keymap.set("n", "<leader>ag", vim.lsp.buf.references, { buffer = true, desc = 'Find References' })
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = true, desc = 'Rename' })
    vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, { buffer = true, desc = 'Signature Help' })
    vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { noremap = true, silent = true, buffer = true , desc = 'Show Diagnostics' })
end

return M
