vim.pack.add(
  {
    "https://github.com/RRethy/vim-illuminate",
  }
)

require("illuminate").configure(
  {
    delay = 200,
    large_file_cutoff = 2000,
    large_file_overrides = {
      providers = { "lsp", "treesitter", "regex" },
    },
  }
)
