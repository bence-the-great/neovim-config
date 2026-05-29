vim.pack.add(
  {
    "https://github.com/nvim-tree/nvim-web-devicons",
    "https://github.com/stevearc/aerial.nvim",
  }
)

require("aerial").setup(
  {
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown", "man" },
    show_guides = true,
  }
)

vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle<cr>", { desc = "Toggle Aerial" })
