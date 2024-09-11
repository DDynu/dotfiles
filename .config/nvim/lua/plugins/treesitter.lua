return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",

    config = function()
        --add treesitter configs
        local configs = require("nvim-treesitter.configs");
        configs.setup({
            auto_install = true,
            ensure_installed = { "c", "lua", "javascript", "html", "css", "python", },
            highlight = { enable = true },
            indent = { enable = true },
        }
        )
    end
}
