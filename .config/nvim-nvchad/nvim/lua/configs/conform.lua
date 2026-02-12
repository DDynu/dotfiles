local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    python = { "black" },
    c = { "clang_format" },
    cpp = { "clang_format" },
  },

  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 1000,
    lsp_fallback = true,
  },

  formatters = {
    clang_format = {
      prepend_args = {
        "-style={UseTab: Always, IndentWidth: 4, TabWidth: 4}",
      },
    },
  },
}

return options
