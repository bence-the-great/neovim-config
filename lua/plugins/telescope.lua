local function getSelectedText()
  vim.cmd("noautocmd normal! \"vy\"")
  return vim.fn.getreg("v")
end

return {
  "nvim-telescope/telescope.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  keys = {
    { "<leader>ft", "<cmd>Telescope<cr>", desc = "Open Telescope" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find files" },
    { "<leader>fg", "<cmd>Telescope git_files<cr>", desc = "Find files in git" },
    { "<leader>fl", "<cmd>Telescope live_grep<cr>", desc = "Live grep" },
    { "<leader>fp", "<cmd>Telescope projects<cr>", desc = "Search projects" },
    {
      "<leader>fl",
      function ()
        require("telescope.builtin").live_grep({default_text = getSelectedText()})
      end,
      mode = "v",
      desc = "Live grep selection",
    },
    {
      "<leader>fc",
      function ()
        require("telescope.builtin").current_buffer_fuzzy_find({default_text = getSelectedText()})
      end,
      mode = "v",
      desc = "Find selection in current buffer",
    },
    { "<leader>fn", "<cmd>Telescope noice<cr>", desc = "Find notification" },
  },
  config = function (_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    telescope.load_extension("noice")
    telescope.load_extension("projects")
  end,
}

