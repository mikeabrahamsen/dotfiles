vim.opt.title = true
vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.shiftround = true
vim.opt.autoindent = true
vim.opt.list = true
vim.opt.clipboard = "unnamed,unnamedplus"
vim.opt.startofline = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.backup = true
vim.opt.backupdir = "~/tmp"
vim.opt.directory = "~/tmp"
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.wrap = false
vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
