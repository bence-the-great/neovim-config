vim.pack.add(
  {
    "https://github.com/petertriho/nvim-scrollbar",
  }
)

require("scrollbar").setup({
  handle = {
    color = "#666666",
    hide_if_all_visible = false,
  },
  handlers = {
    cursor = true,
    diagnostic = true,
    gitsigns = true,
    handle = true,
    search = true, -- Requires hlslens
    ale = false, -- Requires ALE
  },
  excluded_filetypes = {
    "cmp_docs",
    "cmp_menu",
    "noice",
    "notify",
    "prompt",
    "TelescopePrompt",
    "neo-tree",
    "NeogitStatus",
  },
})

