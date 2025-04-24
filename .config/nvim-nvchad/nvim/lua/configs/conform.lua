local options = {
	formatters_by_ft = {
		javascript = { "prettierd" },
		typescript = { "prettierd" },
		javascriptreact = { "prettierd" },
		typescriptreact = { "prettierd" },
		css = { "prettierd" },
		html = { "prettierd" },
		json = { "prettierd" },
		yaml = { "prettierd" },
		markdown = { "prettierd" },
		lua = { "stylua" },
		python = { "isort", "black" },
		cpp = { "clang_format" },
	},

	formatters = {
		prettier = {
			args = { "--tab-width", "4" },
		},
		clang_format = {
			args = {
				"--style={IndentWidth: 4, TabWidth: 4, UseTab: Never, AccessModifierOffset: -4, ConstructorInitializerIndentWidth: 4}",
			},
		},
	},
	-- format_on_save = {
	--   -- These options will be passed to conform.format()
	--   timeout_ms = 500,
	--   lsp_fallback = true,
	-- },
}

return options
