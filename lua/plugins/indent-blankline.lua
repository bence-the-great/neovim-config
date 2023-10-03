return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  event = "VeryLazy",
  opts = {
    exclude = {
      buftypes = {
        "nofile",
        "terminal",
      },
      filetypes = {
        "help",
        "aerial",
        "lazy",
        "neo-tree",
        "toggleterm",
        "dashboard",
      },
    },
  },
}

