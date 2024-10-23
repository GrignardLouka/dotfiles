-- ~/nvim/lua/v10/plugins/formatter.lua

return {
	-- automatic formatting
	{ -- stevearc/conform.nvim
		"stevearc/conform.nvim",
		event = { "BufReadPre", "BufNewFile" },
		cmd = { "ConformInfo" },
		config = function()
			local conform = require("conform")

			conform.setup({
				formatters_by_ft = {
					lua = { "stylua" },
					python = { "isort", "black" },
					latex = { "latexindent" },
					tex = { "latexindent" },
					markdown = { "prettier" },
				},
				format_on_save = {
					lsp_fallback = true,
					async = false,
					timeout_ms = 500,
				},
			})

			vim.keymap.set({ "n", "v" }, "<leader>f", function()
				conform.format({
					lsp_format = "fallback",
					async = true,
					timeout_ms = 500,
				})
			end, { desc = "[F]ormat buffer" })
		end,
	},

	-- Auto change tab width based upon the used language
	{ "tpope/vim-sleuth" },
}
