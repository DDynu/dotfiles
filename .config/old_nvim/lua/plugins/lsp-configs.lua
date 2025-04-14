return {
	--mason
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},
	--lspconfig mason
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = { "lua_ls" },
			})
		end,
	},
	--lspconfig
	{
		"neovim/nvim-lspconfig",
		config = function()
			local capabilities = require("cmp_nvim_lsp").default_capabilities()
			local lspconfig = require("lspconfig")
			--For lua
			lspconfig.lua_ls.setup({
				capabilities = capabilities,
			})
			--For javascript
			lspconfig.ts_ls.setup({
				capabilities = capabilities,
			})
			--For html
			lspconfig.html.setup({
				capabilities = capabilities,
			})
			--For css
			lspconfig.cssls.setup({
				capabilities = capabilities,
			})
			--For python
			lspconfig.pyright.setup({
				capabilities = capabilities,
			})
			--For C++
			lspconfig.clangd.setup({
				capabilities = capabilities,
			})
			-- For shell scripting
			lspconfig.bashls.setup({
				capabilities = capabilities,
			})
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n" }, "<leader>ca", vim.lsp.buf.code_action, {})
			vim.keymap.set({ "n" }, "<leader>gl", vim.diagnostic.open_float, { noremap = true, silent = true})
		end,
	},
	{
		"nvim-telescope/telescope-ui-select.nvim",
		config = function()
			require("telescope").setup({
				extensions = {
					["ui-select"] = {
						require("telescope.themes").get_dropdown({}),
					},
				},
			})
			require("telescope").load_extension("ui-select")
		end,
	},
}
