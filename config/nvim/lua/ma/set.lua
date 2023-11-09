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
vim.opt.backupdir = os.getenv( "HOME" ) .. '/tmp/vim/backup'
vim.opt.directory = os.getenv( "HOME" ) .. '/tmp/vim/swap'

-- Check for persistent undo support
if vim.fn.has("persistent_undo") == 1 then
  vim.opt.undofile = true
  local home_dir = vim.fn.getenv("HOME")
  vim.opt.undodir = home_dir .. '/tmp/vim/undo'
end

vim.opt.wrap = false
vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.opt.colorcolumn = "80"
