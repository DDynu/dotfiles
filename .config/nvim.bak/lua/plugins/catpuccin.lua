return {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    config = function()
        --add catpuccin
        require("catppuccin").setup()
        vim.cmd.colorscheme("catppuccin-macchiato")
    end,
}
