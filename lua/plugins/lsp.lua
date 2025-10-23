return {
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      {
        "williamboman/mason-lspconfig.nvim",
        opts = {},
        dependencies = {"mason-org/mason.nvim", opts = {}},
      },
    },
    config = function()
      vim.api.nvim_create_autocmd('LspAttach', {
        desc = 'LSP actions',
        callback = function(event)
          local telescope_builtin = require("telescope.builtin")

          vim.keymap.set("n", "grr", function() telescope_builtin.lsp_references() end, {desc = "👈 References", buffer = event.buf})
          vim.keymap.set("n", "grd", function() telescope_builtin.lsp_definitions() end, {desc = "📚 Definitions", buffer = event.buf})
          vim.keymap.set("n", "gri", function() telescope_builtin.lsp_implementations() end, {desc = "👷 Implementations", buffer = event.buf})
          vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, {desc = "🙋‍♂️ Signature help", buffer = event.buf})
          vim.keymap.set("n", "<leader>sd", function() vim.diagnostic.open_float(0, { scope = "line" }) end, {desc = "🩺 Line diagnostics", buffer = event.buf})
          vim.keymap.set("n", "gO", function() telescope_builtin.lsp_document_symbols() end, {desc = "󰍉 Document symbols", buffer = event.buf})
          vim.keymap.set("n", "gW", function() telescope_builtin.lsp_dynamic_workspace_symbols() end, {desc = "📺 Workspace symbols", buffer = event.buf})
        end,
      })

      vim.lsp.config.basedpyright = {
        settings = {
          basedpyright = {
            analysis = {
              diagnosticSeverityOverrides = {
                reportMissingTypeStubs = false,
                reportUnusedCallResult = false,
                reportMissingTypeArgument = false,
                reportMissingParameterType = false,
                reportUnknownArgumentType = false,
                reportUnknownLambdaType = false,
                reportUnknownMemberType = false,
                reportUnknownParameterType = false,
                reportUnknownVariableType = false,
                reportUnannotatedClassAttribute = false,
                reportAny = false,
              }
            }
          }
        }
      }
    end,
  },
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local cmp = require("cmp")
      local cmp_select_opts = { behavior = cmp.SelectBehavior.Select }

      cmp.setup({
        sources = {
          { name = "nvim_lsp" },
        },
        mapping = {
          ["<cr>"] = cmp.mapping.confirm({ select = true }),
          ["<tab>"] = cmp.mapping.confirm({ select = true }),
          ["<esc>"] = cmp.mapping.abort(),
          ["<C-u>"] = cmp.mapping.scroll_docs(-4),
          ["<C-d>"] = cmp.mapping.scroll_docs(4),
          ["<Up>"] = cmp.mapping.select_prev_item(cmp_select_opts),
          ["<Down>"] = cmp.mapping.select_next_item(cmp_select_opts),
        },
      })
    end,
  },
}

