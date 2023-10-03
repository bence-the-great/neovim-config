return {
  'stevearc/aerial.nvim',
  cmd = { "AerialToggle" },
  keys = {
    {"<leader>a", "<cmd>AerialToggle<cr>", desc = "Toggle Aerial"},
  },
  opts = {
    attach_mode = "global",
    backends = { "lsp", "treesitter", "markdown", "man" },
    show_guides = true,
  },
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons"
  },
}

