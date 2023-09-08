return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Toggle Neotree" },
  },
  opts = {
    auto_clean_after_session_restore = true,
    sources = { "filesystem", "buffers", "git_status" },
    commands = {
      parent_or_close = function(state)
        local node = state.tree:get_node()
        if (node.type == "directory" or node:has_children()) and node:is_expanded() then
          state.commands.toggle_node(state)
        else
          require("neo-tree.ui.renderer").focus_node(state, node:get_parent_id())
        end
      end,
      child_or_open = function(state)
        local node = state.tree:get_node()
        if node.type == "directory" or node:has_children() then
          if not node:is_expanded() then -- if unexpanded, expand
            state.commands.toggle_node(state)
          else -- if expanded and has children, seleect the next child
            require("neo-tree.ui.renderer").focus_node(state, node:get_child_ids()[1])
          end
        else -- if not a directory just open it
          state.commands.open(state)
        end
      end,
      copy_selector = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local filename = node.name
        local modify = vim.fn.fnamemodify

        local vals = {
          ["BASENAME"] = modify(filename, ":r"),
          ["EXTENSION"] = modify(filename, ":e"),
          ["FILENAME"] = filename,
          ["PATH (CWD)"] = modify(filepath, ":."),
          ["PATH (HOME)"] = modify(filepath, ":~"),
          ["PATH"] = filepath,
          ["URI"] = vim.uri_from_fname(filepath),
        }

        local options = vim.tbl_filter(function(val) return vals[val] ~= "" end, vim.tbl_keys(vals))
        if vim.tbl_isempty(options) then
          vim.notify("No values to copy", vim.log.levels.WARN)
          return
        end
        table.sort(options)
        vim.ui.select(options, {
          prompt = "Choose to copy to clipboard:",
          format_item = function(item) return ("%s: %s"):format(item, vals[item]) end,
        }, function(choice)
          local result = vals[choice]
          if result then
            vim.notify(("Copied: `%s`"):format(result))
            vim.fn.setreg("+", result)
          end
        end)
      end,
      find_in_dir = function(state)
        local node = state.tree:get_node()
        local path = node:get_id()
        require("telescope.builtin").find_files {
          cwd = node.type == "directory" and path or vim.fn.fnamemodify(path, ":h"),
        }
      end,
    },
    window = {
      width = 40,
      position = "left",
      mappings = {
        ["<space>"] = "none",
        ["Y"] = "copy_selector",
        ["h"] = "parent_or_close",
        ["<left>"] = "parent_or_close",
        ["l"] = "child_or_open",
        ["<right>"] = "child_or_open",
        ["o"] = "open",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        visible = true,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          ".git",
        },
        never_show = {
          ".DS_Store",
          ".pytest_cache",
          ".ruff_cache",
          ".mypy_cache",
          "__pycache__",
        },
      },
    },
    default_component_configs = {
      git_status = {
        symbols = {
          unstaged = "u",
          staged = "s",
        },
      },
    },
  },
}

