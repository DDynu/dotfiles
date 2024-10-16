return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua.with({
					extra_args = { "--tab-width", "4" },
				}),
				null_ls.builtins.formatting.prettier.with({
					extra_args = { "--tab-width", "4" },
				}),
				null_ls.builtins.formatting.clang_format.with({
					extra_args = {
						"--style={IndentWidth: 4, TabWidth: 4, UseTab: Never}" },
				}),
			},
		})
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})
	end,
}
