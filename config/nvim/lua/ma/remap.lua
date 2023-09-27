vim.g.mapleader = " "
vim.keymap.set("n", "_", ":sp<cr>")
vim.keymap.set("n", "<bar>", ":vsp<cr>")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<C-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<leader>q", [[:lua ToggleQuickfix()<CR>]])

function ToggleQuickfix()
  local qf_exists = false
  for _, win in pairs(vim.fn.getwininfo()) do
    if win["quickfix"] == 1 then
      qf_exists = true
    end
  end
  if qf_exists == true then
        vim.cmd('cclose')
    else
        print("Quickfix window open")
        vim.cmd('botright copen')
    end
end
