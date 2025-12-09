-- Plugin for parsing and code highlighting
return {
	"nvim-treesitter/nvim-treesitter",
	branch = "master",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- Setting up Treesitter for Parsing and Code Highlighting
		local config = require("nvim-treesitter.configs")
		config.setup({
			auto_install = true, -- Automatically installs parser for any new language open in buffer
			ensure_installed = { "lua", "html", "css", "javascript", "typescript", "java", "python", "go" },
			highlight = { enable = true },
			indent = { enable = true },
		})
	end,
}
