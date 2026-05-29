vim.pack.add(
  {
    "https://github.com/rcarriga/nvim-notify",
    "https://github.com/MunifTanjim/nui.nvim",
    "https://github.com/folke/noice.nvim",
  }
)

require("noice").setup({
  lsp = {
    hover = { enabled = false },
    signature = { enabled = false },
  },
})
