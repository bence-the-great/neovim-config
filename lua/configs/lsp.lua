vim.lsp.config.lua_ls = {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = { { ".luarc.json", ".luarc.jsonc" }, ".git" },
}


vim.lsp.config.basedpyright = {
  cmd = { "basedpyright-langserver", "--stdio" },
  filetypes = { "python" },
  root_markers = {
    "pyrightconfig.json",
    "pyproject.toml",
    "setup.py",
    "setup.cfg",
    "requirements.txt",
    "Pipfile",
    ".git",
  },
}

vim.lsp.config.ty = {
  cmd = { "ty", "server" },
  filetypes = { "python" },
  root_markers = { "ty.toml", "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", ".git" },
}

vim.lsp.config.helm_ls = {
  cmd = { "helm_ls", "serve" },
  filetypes = { "helm", "yaml.helm-values" },
  root_markers = { "Chart.yaml" },
  capabilities = {
    workspace = {
      didChangeWatchedFiles = {
        dynamicRegistration = true,
      },
    },
  },
}

vim.lsp.config.terraform_ls = {
  cmd = { "terraform-ls", "serve" },
  filetypes = { "terraform", "terraform-vars", "tf" },
  root_markers = { ".terraform", ".git" },
}

vim.lsp.config.copilot = {
  cmd = { "copilot-language-server", "--stdio" },
  root_markers = { ".git" },
  init_options = {
    editorInfo = {
      name = "Neovim",
      version = tostring(vim.version()),
    },
    editorPluginInfo = {
      name = "Neovim",
      version = tostring(vim.version()),
    },
  },
  settings = {
    telemetry = {
      telemetryLevel = "all",
    },
  },
}

vim.lsp.enable("lua_ls")
vim.lsp.enable("basedpyright")
-- vim.lsp.enable("ty")
vim.lsp.enable("helm_ls")
vim.lsp.enable("terraform_ls")
