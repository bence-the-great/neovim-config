return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ':TSUpdate',
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  opts = {
    ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "go", "gomod", "gosum", "gowork", "gotmpl", "rust", "proto", "regex", "markdown", "toml", "hcl", "terraform", "yaml", "dockerfile", "csv", "just"},
    sync_install = false,
    auto_install = true,
    ignore_install = { "javascript" },
    highlight = {
      enable = true,
      disable = function(lang, buf)
        local max_filesize = 100 * 1024 -- 100 KB
        local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        if ok and stats and stats.size > max_filesize then
          return true
        end
      end,
      additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn", -- set to `false` to disable one of the mappings
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },
    indent = {
      enabled = true,
    },
  },
  config = function (_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}

