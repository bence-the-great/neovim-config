return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  lazy = true,
  config = function()
    require('lsp-zero.settings').preset({})
  end,
  dependencies = {
    -- LSP Support
    {
      'neovim/nvim-lspconfig',
      cmd = 'LspInfo',
      event = {'BufReadPre', 'BufNewFile'},
      dependencies = {
        {'hrsh7th/cmp-nvim-lsp'},
        {'williamboman/mason.nvim'},
        {
          'williamboman/mason-lspconfig.nvim',
          cmd = { "LspInstall", "LspUninstall" },
        }, 
      },
    },

    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {'L3MON4D3/LuaSnip'},
    },

    -- Aerial
    {
      'stevearc/aerial.nvim',
      cmd = { "AerialToggle" },
      opts = {
        attach_mode = "global",
        backends = { "lsp", "treesitter", "markdown", "man" },
        show_guides = true,
      },
      dependencies = {
        "nvim-treesitter/nvim-treesitter",
        "nvim-tree/nvim-web-devicons"
      },
      config = function()
        require('telescope').load_extension('aerial')
      end,
    },
  }
}

