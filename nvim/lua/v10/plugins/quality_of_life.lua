-- ~/.config/nvim/lua/v10/plugins/quality_of_life.lua
return {
	-- autocomplete brackets, quots, ...
	{
		"windwp/nvim-autopairs",
		event = "InsertEnter",
		config = function()
			require("nvim-autopairs").setup({
				disable_filetype = { "TelescopePrompt", "vim" },
			})
		end,
	},
	-- Auto change tab width based upon the used language
	{ "tpope/vim-sleuth" },
	-- show files in a tree
	{
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v3.x",
		dependencies = {
			"nvim-lua/plenary.nvim",
			"nvim-tree/nvim-web-devicons",
			"MunifTanjim/nui.nvim",
			"3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
		},
		config = function()
			vim.fn.sign_define("DiagnosticSignError", { text = " ", texthl = "DiagnosticSignError" })
			vim.fn.sign_define("DiagnosticSignWarn", { text = " ", texthl = "DiagnosticSignWarn" })
			vim.fn.sign_define("DiagnosticSignInfo", { text = " ", texthl = "DiagnosticSignInfo" })
			vim.fn.sign_define("DiagnosticSignHint", { text = "󰌵", texthl = "DiagnosticSignHint" })

			require("neo-tree").setup({
				close_if_last_window = true,
				popup_border_style = "rounded",
				enable_git_status = true,
				enable_diagnostics = true,
			})
		end,
	},

	-- vim surround
	{
		"tpope/vim-surround",
	},

	-- vim commentary
	{ "tpope/vim-commentary" },

	-- vim fugitive
	{ "tpope/vim-fugitive" },

	-- tpope sensible
	-- { "tpope/vim-sensible" },

	--
	{ "tpope/vim-repeat" },
}
