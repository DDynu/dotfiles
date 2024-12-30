-- return {
--     "catppuccin/nvim",
--     name = "catppuccin",
--     priority = 1000,
--     config = function()
--         --add catpuccin
--         require("catppuccin").setup()
--         vim.cmd.colorscheme("catppuccin-macchiato")
--     end,
-- }

return {
	"neanias/everforest-nvim",
	version = false,
	lazy = false,
	priority = 1000, -- make sure to load this before all the other start plugins
	-- Optional; default configuration will be used if setup isn't called.
	config = function()
		require("everforest").setup({
			-- Your config here
			vim.cmd([[colorscheme everforest]])

		})
	end,
}
