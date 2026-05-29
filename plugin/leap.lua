vim.pack.add(
  {
    "https://codeberg.org/andyg/leap.nvim",
  }
)

vim.keymap.set({ "n", "x", "o" }, "<leader>s", "<Plug>(leap)")

