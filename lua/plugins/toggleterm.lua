return {
  "akinsho/toggleterm.nvim",
  cmd = { "ToggleTerm", "TermExec" },
  keys = {
    {"<leader>tt", "<cmd>ToggleTerm<cr>", desc = "ToggleTerm"},
    {"<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float"},
    {"<F19>", "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float"},
    {"<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", desc = "ToggleTerm horizontal split"},
    {"<F19>", "<cmd>ToggleTerm<cr>", mode = "t", desc = "Hide terminal"},
    {"<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", desc = "ToggleTerm vertical split"},
  },
  config = true,
}

