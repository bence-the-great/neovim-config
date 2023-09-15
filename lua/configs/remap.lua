vim.g.mapleader = " "
vim.keymap.set("n", "<leader>q", vim.cmd.q)

-- Movements between windows
vim.keymap.set("n", "<C-h>", "<C-w>h")
vim.keymap.set("n", "<C-j>", "<C-w>j")
vim.keymap.set("n", "<C-k>", "<C-w>k")
vim.keymap.set("n", "<C-l>", "<C-w>l")
vim.keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h")
vim.keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j")
vim.keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k")
vim.keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l")

-- Resize windows
vim.keymap.set("n", "<C-Up>", "<cmd>resize -2<cr>")
vim.keymap.set("n", "<C-Down>", "<cmd>resize +2<cr>")
vim.keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<cr>")
vim.keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<cr>")
vim.keymap.set("t", "<C-Up>", "<C-\\><C-n><cmd>resize -2<cr>")
vim.keymap.set("t", "<C-Down>", "<C-\\><C-n><cmd>resize +2<cr>")
vim.keymap.set("t", "<C-Left>", "<C-\\><C-n><cmd>vertical resize -2<cr>")
vim.keymap.set("t", "<C-Right>", "<C-\\><C-n><cmd>vertical resize +2<cr>")

