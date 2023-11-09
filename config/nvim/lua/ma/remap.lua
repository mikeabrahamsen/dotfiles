vim.g.mapleader = " "
vim.keymap.set("n", "_", ":sp<cr>")
vim.keymap.set("n", "<bar>", ":vsp<cr>")
vim.keymap.set("n", "<c-j>", "<c-w>j")
vim.keymap.set("n", "<C-k>", "<c-w>k")
vim.keymap.set("n", "<c-l>", "<c-w>l")
vim.keymap.set("n", "<c-h>", "<c-w>h")
vim.keymap.set("n", "<leader>q", [[:lua ToggleQuickfix()<CR>]])
vim.keymap.set("n", "<leader>fml", "<cmd>CellularAutomaton make_it_rain<CR>")

-- Ctrl-b: Go (b)ack. Go to previously buffer
vim.keymap.set("n", "<c-b>", "<c-^>")
vim.keymap.set("n", "<leader>w", "<cmd>:bprevious<CR>")
vim.keymap.set("n", "<leader>v", "<cmd>:bnext<CR>")
vim.keymap.set("n", "<CR>", "<cmd>:noh<CR>", { noremap = true })

-- chatgpt
vim.keymap.set({"n", "v"}, "<leader>ce", "<cmd>ChatGPTEditWithInstruction<CR>")
vim.keymap.set({"n", "v"}, "<leader>cx", "<cmd>ChatGPTRun explain_code<CR>")

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
        vim.cmd('botright copen')
    end
end
