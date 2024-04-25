return {
  "ahmedkhalf/project.nvim",
  config = function(_, opts)
    require("project_nvim").setup({
      show_hidden = true,
      detection_methods = { "pattern" },
      patterns = {".git"},
    })
  end,
}

