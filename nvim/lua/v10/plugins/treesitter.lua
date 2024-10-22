--- ~/nvim/lua/v10/plugins/treesiter.lua

return {
	"nvim-treesitter/nvim-treesitter",

	event = { "BufReadPre", "BufNewFile" },
	build = ":TSUpdate",
	dependencies = {
		"windwp/nvim-ts-autotag",
	},
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
			indent = { enable = true },
			-- autotag

			-- hmtl auto change tag
			autotag = { enable = true },

			ensure_installed = {
				"json",
				"javascript",
				"typescript",
				"tsx",
				"yaml",
				"html",
				"css",
				"markdown",
				"markdown_inline",
				"bash",
				"lua",
				"luadoc",
				"vim",
				"dockerfile",
				"gitignore",
				"c",
				"rust",
				"python",
				"diff",
				"query",
				"latex",
			},

			-- incremental_selection = {
			-- 	enable = true,
			-- 	keymaps = {
			-- 		init_selection = "<C-space>",
			-- 		node_incremental = "<C-space>",
			-- 		scope_incremental = false,
			-- 		node_decremental = "<bs>",
			-- 	},
			-- },

			-- rainbow = {
			-- 	enable = true,
			-- 	disable = { "html" },
			-- 	extended_mode = false,
			-- 	max_file_lines = nil,
			-- },
			--
			-- context_commentstring = {
			-- 	enable = true,
			-- 	enable_autocmd = false,
			-- },
		})
	end,
}
