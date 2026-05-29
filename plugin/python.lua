vim.pack.add(
  {
    "https://github.com/linux-cultist/venv-selector.nvim",
  }
)

require("venv-selector").setup(
  {
    parents = 1,
    name = {"venv", ".venv"},
    dap_enabled = false, -- makes the debugger work with venv
  }
)

