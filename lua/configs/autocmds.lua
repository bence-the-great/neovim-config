vim.api.nvim_create_augroup("user_commands", {clear = true})
vim.api.nvim_create_augroup("git", {})
vim.api.nvim_create_augroup("python", {})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*COMMIT_EDITMSG",
  callback = function()
    vim.api.nvim_set_option_value("colorcolumn", "50,72", {})
  end,
  group = "git",
})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*.py",
  callback = function()
    vim.api.nvim_set_option_value("colorcolumn", "120", {})
  end,
  group = "python",
})

vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight on yank",
  group = "user_commands",
  callback = function()
    vim.highlight.on_yank({higroup = "Visual", timeout = 200})
  end,
})

