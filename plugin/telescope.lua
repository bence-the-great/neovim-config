vim.pack.add(
  {
    "https://github.com/nvim-lua/plenary.nvim",
    "https://github.com/nvim-telescope/telescope.nvim",
  }
)

local telescope = require("telescope")
telescope.setup(
  {
    extensions = {
      fzf = {
        fuzzy = true,                    -- false will only do exact matching
        override_generic_sorter = true,  -- override the generic sorter
        override_file_sorter = true,     -- override the file sorter
        case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
      }
    }
  }
)
telescope.load_extension("noice")
-- telescope.load_extension("fzf")

vim.keymap.set("n", "<leader>ft", "<cmd>Telescope<cr>", { desc = "Open Telescope" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "find files" })
vim.keymap.set("n", "<leader>fl", "<cmd>Telescope live_grep<cr>", { desc = "live grep" })

-- Find selection
local function getSelectedText()
  vim.cmd("noautocmd normal! \"vy\"")
  return vim.fn.getreg("v")
end

vim.keymap.set(
  "v",
  "<leader>fl",
  function ()
    require("telescope.builtin").live_grep({default_text = getSelectedText()})
  end,
  { desc = "live grep" }
)

vim.keymap.set(
  "v",
  "<leader>fc",
  function ()
    require("telescope.builtin").current_buffer_fuzzy_find({default_text = getSelectedText()})
  end,
  { desc = "find selection in current file" }
)

-- LSP
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
