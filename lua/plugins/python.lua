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
    },
    opts = {
      parents = 1,
      name = {"venv", ".venv"},
      dap_enabled = true, -- makes the debugger work with venv
    },
  },
  {
    "wookayin/semshi",
    build = ":UpdateRemotePlugins",
    init = function()
     vim.g['semshi#error_sign'] = false
   end,
  },
}

