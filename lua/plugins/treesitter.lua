return {
  "nvim-treesitter/nvim-treesitter",
  event = "VeryLazy",
  build = ':TSUpdate',
  dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
  opts = {
    ensure_installed = { "lua", "vim", "vimdoc", "query", "python", "go", "rust", "proto", "regex", "markdown" },
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
  },
}

