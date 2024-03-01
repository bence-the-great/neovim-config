return {
  {
    "Vimjas/vim-python-pep8-indent",
    ft = "python",
  },
  {
    "linux-cultist/venv-selector.nvim",
    dependencies = {
      "neovim/nvim-lspconfig",
      "nvim-telescope/telescope.nvim",
      "mfussenegger/nvim-dap-python",
    },
    ft = "python",
    keys = {
      { "<leader>vs", "<cmd>:VenvSelect<cr>" },
      { "<leader>vc", "<cmd>:VenvSelectCached<cr>" },
    },
    opts = {
      parents = 1,
      name = {"venv", ".venv"},
      dap_enabled = true, -- makes the debugger work with venv
    },
  },
}

