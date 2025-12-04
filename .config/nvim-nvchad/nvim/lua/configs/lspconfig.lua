require("nvchad.configs.lspconfig").defaults()

local servers = { "html", "cssls", "pyright", "lua_ls", "clangd", "vtsls", "gdscript" }
vim.lsp.enable(servers)

-- read :h vim.lsp.config for changing options of lsp servers
