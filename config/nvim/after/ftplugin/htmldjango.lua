vim.bo.shiftwidth = 4

-- Enable syntax highlighting
vim.cmd("syntax enable")

-- Customize iskeyword to handle Django template syntax
vim.bo.iskeyword = vim.bo.iskeyword .. ",:"
