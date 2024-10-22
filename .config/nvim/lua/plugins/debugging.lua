return {
	'mfussenegger/nvim-dap',
	dependencies = {
		"rcarriga/nvim-dap-ui",
		"nvim-neotest/nvim-nio",
	},
	config = function()
		local dap, dapui = require("dap"), require("dapui")

		--  dapui setup
		require("dapui").setup()
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

		-- Adapter defintion
		dap.adapters.cppdbg = {
			id = 'cppdbg',
			type = 'executable',
			command = '/home/suponer/.local/share/nvim/mason/packages/cpptools/extension/debugAdapters/bin/OpenDebugAD7',
		}
		dap.configurations.cpp = {
			{
				name = "Launch file",
				type = "cppdbg",
				request = "launch",
				program = function()
					return vim.fn.input('Path to executable: ', vim.api.nvim_buf_get_name(0))
				end,
				cwd = '${workspaceFolder}',
				stopAtEntry = true,
			},
			{
				name = 'Attach to gdbserver :1234',
				type = 'cppdbg',
				request = 'launch',
				MIMode = 'gdb',
				miDebuggerServerAddress = 'localhost:1234',
				miDebuggerPath = '/usr/bin/gdb',
				cwd = '${workspaceFolder}',
				program = function()
					return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
				end,
			},
		}
		vim.keymap.set('n', '<Leader>db', dap.toggle_breakpoint, {})
		vim.keymap.set('n', '<Leader>dc', dap.continue, {})
	end,
}
