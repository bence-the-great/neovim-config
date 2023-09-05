return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.2',
  dependencies = { 'nvim-lua/plenary.nvim' },
  keys = {
    { "<leader>ft", "<cmd>Telescope<cr>", desc = "Open Telescope" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find files in git" },
    { "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
  },
}

