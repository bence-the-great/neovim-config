return {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v2.x',
  lazy = true,
  config = function()
    require('lsp-zero.settings').preset({})
  end,
  dependencies = {
    -- Autocompletion
    {
      'hrsh7th/nvim-cmp',
      event = 'InsertEnter',
      dependencies = {'L3MON4D3/LuaSnip'},
      config = function()
        require('lsp-zero.cmp').extend()
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero.cmp').action()

        cmp.setup({
          mapping = {
            ['<C-Space>'] = cmp.mapping.complete(),
            ['<C-f>'] = cmp_action.luasnip_jump_forward(),
            ['<C-b>'] = cmp_action.luasnip_jump_backward(),
          }
        })
      end,
    },

    -- LSP Support
    {
      "neovim/nvim-lspconfig",
      cmd = "LspInfo",
      event = { "BufReadPre", "BufNewFile" },
      dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        {
          'williamboman/mason.nvim',
          cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
        },
        {
          "williamboman/mason-lspconfig.nvim",
          cmd = { "LspInstall", "LspUninstall" },
        },
      },
      config = function()
        local lsp = require('lsp-zero')

        lsp.on_attach(function(client, bufnr)
          -- see :help lsp-zero-keybindings
          -- to learn the available actions
          lsp.default_keymaps({buffer = bufnr})
        end)

        require('lspconfig').lua_ls.setup(lsp.nvim_lua_ls())
        lsp.setup()
      end,
    },
  },
}

