-- Plugin for Linters, formatters and Auto Completion
return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"nvimtools/none-ls-extras.nvim",
	},
	config = function()
		local null_ls = require("null-ls")

		-- Configure diagnostics display FIRST
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
		vim.diagnostic.config({
			virtual_text = {
				enabled = true,
				source = "if_many", -- Show source if multiple sources
				prefix = "●", -- Could be '■', '▎', 'x', '●', etc.
			},
			signs = true,
			underline = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = "always", -- Show source in floating window
				header = "",
				prefix = "",
			},
		})

		-- Define diagnostic signs
		local signs = {
			Error = " ",
			Warn = " ",
			Hint = " ",
			Info = " ",
		}

		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
		end

		-- Formatters to add in Null LS
		null_ls.setup({
			sources = {
				null_ls.builtins.formatting.stylua, -- Formatter for Lua
				null_ls.builtins.formatting.prettier, -- Formatter for JS
				require("none-ls.diagnostics.eslint"), -- Linter for JS
				null_ls.builtins.formatting.black, -- Formatter for Python
				null_ls.builtins.formatting.isort, -- Linter for Python
				null_ls.builtins.formatting.google_java_format, -- Formatter for Java
				null_ls.builtins.diagnostics.checkstyle, -- Linter for Java
			},
		})

		-- Keymaps for formatting
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, {})

		-- Keymaps for diagnostics
		vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, { desc = "Open diagnostic float" })
		vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous diagnostic" })
		vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next diagnostic" })
	end,
}
