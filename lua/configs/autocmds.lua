vim.api.nvim_create_augroup('git', {})

vim.api.nvim_create_autocmd("BufEnter", {
  pattern = "*COMMIT_EDITMSG",
  callback = function()
    vim.api.nvim_set_option_value("colorcolumn", "50,80", {})
  end,
  group = "git",
})

