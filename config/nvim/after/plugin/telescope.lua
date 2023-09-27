local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader><C-p>', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set("n", "<leader><C-b>", builtin.buffers, {})
vim.keymap.set('n', '<leader>ps', function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") })
end)

vim.keymap.set('n', '<leader>PS', function()
    local selected_text = vim.fn.getreg('v')
    if selected_text ~= "" then
        builtin.grep_string({ search = selected_text })
    else
        print("No text selected in visual mode.")
    end
end)
