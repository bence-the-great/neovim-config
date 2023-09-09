return {
  "kevinhwang91/nvim-hlslens",
  keys = {
    { "<leader>c", "*<cmd>noh<cr>", desc = "" },
    { "*", "*<cmd>lua require('hlslens').start()<cr>", desc = "" },
    { "g*", "g*<cmd>lua require('hlslens').start()<cr>", desc = "" },
    { "#", "#<cmd>lua require('hlslens').start()<cr>", desc = "" },
    { "g#", "g#<cmd>lua require('hlslens').start()<cr>", desc = "" },
    { "n", "<cmd>execute('normal! ' . v:count1 . 'n')<cr><cmd>lua require('hlslens').start()<cr>", desc = "" },
    { "N", "<cmd>execute('normal! ' . v:count1 . 'N')<cr><cmd>lua require('hlslens').start()<cr>", desc = "" },
  },
  opts = {
    calm_down = true,
  },
}

