local options = {
	formatters_by_ft = {
		javascript = { "prettier" },
		typescript = { "prettier" },
		javascriptreact = { "prettier" },
		typescriptreact = { "prettier" },
		css = { "prettier" },
		html = { "prettier" },
		json = { "prettier" },
		yaml = { "prettier" },
		markdown = { "prettier" },
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
