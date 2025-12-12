-- Plugin for Linters, formatters and Auto Completion
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		-- Configure diagnostics display
		vim.diagnostic.config({
			virtual_text = {
				enabled = true,
				source = "if_many",
				prefix = "●",
			},
			signs = {
				text = {
					[vim.diagnostic.severity.ERROR] = " ",
					[vim.diagnostic.severity.WARN] = " ",
					[vim.diagnostic.severity.HINT] = " ",
					[vim.diagnostic.severity.INFO] = " ",
				},
			},
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "always",
				header = "",
				prefix = "",
			},
		})

		-- Setup null-ls
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- Formatter for Lua
				null_ls.builtins.formatting.prettier, -- Formatter for JS
				require("none-ls.diagnostics.eslint"), -- Linter for JS
				null_ls.builtins.formatting.black, -- Formatter for Python
				null_ls.builtins.formatting.isort, -- Formatter for Python
				null_ls.builtins.formatting.google_java_format, -- Formatter for Java
				null_ls.builtins.diagnostics.checkstyle, -- Linter for Java
			},
		})

		-- Format on save
		vim.api.nvim_create_autocmd("BufWritePre", {
			callback = function()
				vim.lsp.buf.format({ async = false })
			end,
		})

		-- Keymaps for formatting
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format file" })

		-- Keymaps for diagnostics
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
	end,
}
