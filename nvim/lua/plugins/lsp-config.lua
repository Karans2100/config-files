return {
	-- Plugin to install various LSP servers
	{
		"mason-org/mason.nvim",
		opts = {},
		config = function()
			require("mason").setup()
		end,
	},
	-- Configuring Mason such that it installs some language servers before doing anything
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {},
		config = function()
			require("mason-lspconfig").setup({
				ensure_installed = {
					"lua_ls", -- Lua
					"ts_ls", -- Typescript/Javascript
					"pyright", -- Python
					-- "gopls", -- Go
					"jdtls", -- Java
				},
			})
		end,
	},
	-- Plugin to enable Nvim to talk to various language server
	{
		"neovim/nvim-lspconfig",
		config = function()
            -- Auto Completion Plugin to talk with LSP
            local capabilities = require("cmp_nvim_lsp").default_capabilities()

			-- Lua
			vim.lsp.config("lua_ls", {capabilities = capabilities})
			vim.lsp.enable("lua_ls")

			-- Keymaps
			vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
			vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, {})

			-- Typescript/Javascript
			vim.lsp.config("ts_ls", {capabilities = capabilities})
			vim.lsp.enable("ts_ls")

			-- Python
			vim.lsp.config("pyright", {capabilities = capabilities})
			vim.lsp.enable("pyright")

			-- Go
			-- vim.lsp.config("gopls", {capabilities = capabilities})
			-- vim.lsp.enable("gopls")

			-- Java
			vim.lsp.config("jdtls", {capabilities = capabilities})
			vim.lsp.enable("jdtls")
		end,
	},
}
