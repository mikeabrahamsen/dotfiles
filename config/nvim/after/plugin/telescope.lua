local builtin = require('telescope.builtin')
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader><C-p>', builtin.find_files, {})
vim.keymap.set("n", "<leader>b", builtin.buffers, {})
vim.keymap.set("n", "<leader>:", builtin.command_history, {})
vim.keymap.set("n", "<leader>/", builtin.search_history, {})
vim.keymap.set("n", "<leader>man", builtin.man_pages, {})


vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)
