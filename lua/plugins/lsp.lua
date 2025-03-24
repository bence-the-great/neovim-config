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
      dependencies = {
        "L3MON4D3/LuaSnip",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function ()
          require("luasnip.loaders.from_vscode").lazy_load()
        end
      },
      config = function()
        require('lsp-zero.cmp').extend()
        local cmp = require('cmp')
        local cmp_action = require('lsp-zero.cmp').action()
        local cmp_select_opts = {behavior = cmp.SelectBehavior.Select}

        cmp.setup({
          mapping = {
            ['<cr>'] = cmp.mapping.confirm({select = true}),
            ['<tab>'] = cmp.mapping.confirm({select = true}),
            ['<esc>'] = cmp.mapping.abort(),
            ['<C-u>'] = cmp.mapping.scroll_docs(-4),
            ['<C-d>'] = cmp.mapping.scroll_docs(4),
            ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
            ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
          },
          snippet = {
            expand = function (args)
              require("luasnip").lsp_expand(args.body)
            end
          },
        })
      end,
    },

    -- LSP Support
    {
      "neovim/nvim-lspconfig",
      cmd = "LspInfo",
      event = { "BufReadPre", "BufNewFile" },
      keys = {
        { "gd", vim.lsp.buf.definition, desc = "Goto Definition" },
        { "gr", function() require('telescope.builtin').lsp_references() end, desc = "Goto References" },
        { "<leader>sd", function () vim.diagnostic.open_float(0, {scope="line"}) end, desc = "Show diagnostic message" },
      },
      dependencies = {
        { "hrsh7th/cmp-nvim-lsp" },
        {
          'williamboman/mason.nvim',
          cmd = { "Mason", "MasonInstall", "MasonUninstall", "MasonUninstallAll", "MasonLog", "MasonUpdate" },
        },
        {
          "williamboman/mason-lspconfig.nvim",
          cmd = { "LspInstall", "LspUninstall" },
        },
      },
      config = function()
        local lsp = require('lsp-zero')
        local lsp_config = require('lspconfig')

        lsp.on_attach(function(client, bufnr)
          -- see :help lsp-zero-keybindings
          -- to learn the available actions
          lsp.default_keymaps({buffer = bufnr})
        end)

        lsp_config.lua_ls.setup(lsp.nvim_lua_ls())
        lsp_config.basedpyright.setup(lsp.nvim_lua_ls())
        lsp_config.gopls.setup(lsp.nvim_lua_ls())
        lsp_config.protols.setup(lsp.nvim_lua_ls())

        lsp.setup()
      end,
    },
  },
}

