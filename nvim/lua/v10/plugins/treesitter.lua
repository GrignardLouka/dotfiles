--- ~/nvim/lua/v10/plugins/treesiter.lua

return {
	"nvim-treesitter/nvim-treesitter",

	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	config = function()
		local treesitter = require("nvim-treesitter.configs")

		-- Select Optionals
		treesitter.setup({
			auto_install = true,
			modules = {},
			sync_install = true,
			ignore_install = {},

			diagnostics = { disable = { "missing-fields" } },
			-- highlights
			highlight = {
				enable = true,
				-- disable = { "latex" },
			},
			-- indentation
			-- indent = { enable = true },

			ensure_installed = {
				"json",
				-- "javascript",
				-- "typescript",
				-- "tsx",
				-- "yaml",
				-- "html",
				-- "css",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"luadoc",
				"vim",
				-- "dockerfile",
				"gitignore",
				"c",
				"rust",
				"python",
				-- "diff",
				-- "query",
				-- "latex",
			},

			-- incremental_selection = {
			-- 	enable = true,
			-- 	keymaps = {
			-- 		init_selection = "gn", -- set to `false` to disable one of the mappings
			-- 		node_incremental = "grn",
			-- 		scope_incremental = "grc",
			-- 		node_decremental = "grm",
			-- 	},
			-- },
		})
	end,
}
