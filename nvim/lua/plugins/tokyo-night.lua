-- Plugin for Theme
return {
	"folke/tokyonight.nvim",
	lazy = false,
	priority = 1000,
	opts = {},
	-- This function is called when the plugin is loaded by Lazy
	config = function()
		-- Setting up color theme
		vim.cmd("colorscheme tokyonight-night")
	end,
}
