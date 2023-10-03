return {
  "nvim-treesitter/nvim-treesitter-context",
  event = { "BufReadPre", "BufNewFile" },
  keys = {
    {"őc", function() require("treesitter-context").go_to_context() end, desc = "Jump up in context"},    
  },
}

