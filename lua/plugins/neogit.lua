return {
  "NeogitOrg/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",        
    "nvim-telescope/telescope.nvim",
    "sindrets/diffview.nvim",       
  },
  config = true,
  event = "VeryLazy",
  keys = {
    { "<leader>Gg", "<cmd>Neogit<cr>", desc = "Open Neogit" },
    { "<leader>Gc", "<cmd>Neogit commit<cr>", desc = "Git commit" },
  },
}

