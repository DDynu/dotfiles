local mason_dap = require "mason-nvim-dap"
local dap = require "dap"
local ui = require "dapui"
local dap_virtual_text = require "nvim-dap-virtual-text"

-- Dap Virtual Text
dap_virtual_text.setup()

mason_dap.setup {
  ensure_installed = { "cppdbg", "codelldb" },
  automatic_installation = true,
  handlers = {
    function(config)
      require("mason-nvim-dap").default_setup(config)
    end,
  },
}

dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "--interpreter=dap", "--eval-command", "set print pretty on" },
}
dap.adapters.codelldb = {
  type = "executable",
  command = "codelldb",
}

-- Configurations
dap.configurations = {
  c = {
    {
      name = "Launch file",
      type = "codelldb",
      request = "launch",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      args = {},
      cwd = "${workspaceFolder}",
      stopOnEntry = false,
      -- MIMode = "lldb",
    },
    {
      name = "Select and attach to process",
      type = "codelldb",
      request = "attach",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      pid = function()
        local name = vim.fn.input "Executable name (filter): "
        return require("dap.utils").pick_process { filter = name }
      end,
      cwd = "${workspaceFolder}",
    },
    {
      name = "Attach to gdbserver :1234",
      type = "codelldb",
      request = "attach",
      target = "localhost:1234",
      program = function()
        return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
      end,
      cwd = "${workspaceFolder}",
    },
  },
  cpp = dap.configurations.c,
}

-- Dap UI

ui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "🔴" })

dap.listeners.after.attach.dapui_config = function()
  ui.open()
end
dap.listeners.after.launch.dapui_config = function()
  ui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
  ui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
  ui.close()
end
