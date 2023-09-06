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
      },
    }); 
    vim.cmd([[colorscheme catppuccin]])
  end,
}

