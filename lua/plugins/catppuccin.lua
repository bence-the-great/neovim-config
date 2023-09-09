return {
  "catppuccin/nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      -- transparent_background = true,
      show_end_of_buffer = true,
      integrations = {
        treesitter = true,
        neotree = true,
        gitsigns = true,
        noice = true,
        telescope = true,
        neogit = true,
        indent_blankline = {
          enabled = true,
          colored_indent_levels = true,
        },
        illuminate = {
          enabled = true,
          lsp = false
        },
        which_key = true,
        cmp = true,
        native_lsp = {
          enabled = true,
          virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
          },
          underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
          },
          inlay_hints = {
            background = true,
          },
        },
      },
    });
    vim.cmd([[colorscheme catppuccin]])
  end,
}

