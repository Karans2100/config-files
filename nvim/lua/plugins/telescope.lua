return {
	-- Plugin for Fuzzy Finding file Telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "v0.1.9",
		dependencies = { "nvim-lua/plenary.nvim" },

		-- Setting up Telescope to find files and its contents through live grep
		config = function()
			local builtin = require("telescope.builtin")
			-- Find files including hidden ones
			vim.keymap.set("n", "<C-p>", function()
				builtin.find_files({ hidden = true })
			end, {})

			-- Live grep for content
			vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		end,
	},

	-- Plugin to see code actions in Telescope UI Window
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
