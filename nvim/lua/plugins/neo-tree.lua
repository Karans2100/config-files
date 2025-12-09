-- Plugin for constructing file structure
return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"MunifTanjim/nui.nvim",
		"nvim-tree/nvim-web-devicons",
	},
	lazy = false,
	config = function()
		-- Neo-tree setup
		require("neo-tree").setup({
			-- Configuration for showing files
			filesystem = {
				filtered_items = {
					hide_dotfiles = false, -- show hidden files like .env
					hide_gitignored = false, -- show files ignored by git
					use_libuv_file_watcher = false, -- <--- Disable watcher
					follow_current_file = true, -- Follow the current file in the tree
					group_empty_dirs = true, -- Group empty directories together
					lazy_load = true, -- Lazy load files/folders for performance boost
				},
			},

			-- Configuration for shortcuts
			window = {
				mappings = {
					["o"] = "open",
				},
				width = 35,
			},
		})
		vim.keymap.set("n", "<C-n>", ":Neotree filesystem reveal left<CR>", {})

		-- Auto-open Neo-tree on startup with focus
		vim.api.nvim_create_autocmd("VimEnter", {
			callback = function()
				if vim.fn.argc() == 0 then
					vim.cmd("Neotree focus")
				else
					vim.cmd("Neotree show")
					vim.cmd("wincmd h") -- Move focus left to Neo-tree
				end
			end,
		})
	end,
}
