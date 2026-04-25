return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "theHamsta/nvim-dap-virtual-text",
    {
      "rcarriga/nvim-dap-ui",
      dependencies = {
        "nvim-neotest/nvim-nio",
      },
    },
    "mfussenegger/nvim-dap-python",
  },
  config = function ()
    local dap = require("dap")
    local dapui = require("dapui")
    local dap_python = require("dap-python")

    dapui.setup()
    
    -- Setup Python debugging with debugpy
    dap_python.setup("python")
    
    -- Python debugging configurations
    dap.configurations.python = {
      {
        type = 'python',
        request = 'launch',
        name = "Launch file",
        program = "${file}",
        pythonPath = function()
          return '/usr/bin/python3'
        end,
      },
      {
        type = 'python',
        request = 'launch',
        name = "Launch file with arguments",
        program = "${file}",
        args = function()
          local args_string = vim.fn.input('Arguments: ')
          return vim.split(args_string, " +")
        end,
        pythonPath = function()
          return '/usr/bin/python3'
        end,
      },
      {
        type = 'python',
        request = 'attach',

        name = 'Attach remote',
        connect = function()
          local host = vim.fn.input('Host [127.0.0.1]: ')
          host = host ~= '' and host or '127.0.0.1'
          local port = tonumber(vim.fn.input('Port [5678]: ')) or 5678
          return { host = host, port = port }
        end,
      },
    }

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end

    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end

    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end

    -- Key mappings for debugging
    vim.keymap.set("n", "<leader>dt", dap.toggle_breakpoint, { desc = "Toggle breakpoint" })
    vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Continue" })
    vim.keymap.set("n", "<leader>ds", dap.step_over, { desc = "Step over" })
    vim.keymap.set("n", "<leader>di", dap.step_into, { desc = "Step into" })
    vim.keymap.set("n", "<leader>do", dap.step_out, { desc = "Step out" })
    vim.keymap.set("n", "<leader>dr", dap.repl.open, { desc = "Open REPL" })
    vim.keymap.set("n", "<leader>du", dapui.toggle, { desc = "Toggle DAP UI" })
  end,
}
