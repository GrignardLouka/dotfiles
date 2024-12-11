-- ~/.config/nvim/lua/v10/plugins/quality_of_life.lua
return {

	-- nvim suda
	{
		"lambdalisue/vim-suda",
	},

	-- nvim surround
	{
		"kylechui/nvim-surround",
		event = "VeryLazy",
		config = function()
			require("nvim-surround").setup({
				-- Configuration here, or leave empty to use defaults
			})
		end,
	},

	-- nvim-better-n
	{
		"jonatan-branting/nvim-better-n",
		config = function()
			require("better-n").setup({
				-- These are default values, which can be omitted.
				-- By default, the following mappings are made repeatable using `n` and `<S-n>`:
				-- `f`, `F`, `t`, `T`, `*`, `#`, `/`, `?`
				disable_default_mappings = false,
			})
			vim.api.nvim_create_autocmd("User", {
				pattern = "BetterNMappingExecuted",
				callback = function(args)
					-- args.data.key and args.data.mode are available here
				end,
			})

			local better = require("better-n")
			-- You create repeatable mappings like this:
			local diagnostic_navigation = better.create({
				next = vim.diagnostic.goto_next,
				previous = vim.diagnostic.goto_prev,
			})
			vim.keymap.set({ "n", "x" }, "]d", diagnostic_navigation.next)
			vim.keymap.set({ "n", "x" }, "[d", diagnostic_navigation.previous)
		end,
	},

	-- search/replace in multiple files
	{
		"MagicDuck/grug-far.nvim",
		opts = { headerMaxWidth = 80 },
		cmd = "GrugFar",
		keys = {
			{
				"<leader>rs",
				function()
					local grug = require("grug-far")
					local ext = vim.bo.buftype == "" and vim.fn.expand("%:e")
					grug.open({
						transient = true,
						prefills = {
							filesFilter = ext and ext ~= "" and "*." .. ext or nil,
						},
					})
				end,
				mode = { "n", "v" },
				desc = "Search and Replace",
			},
		},
	},

	-- autocomplete brackets, quots, ...

	-- vim commentary
	-- { "tpope/vim-commentary" },

	-- vim fugitive
	-- { "tpope/vim-fugitive" },

	-- tpope sensible
	-- { "tpope/vim-sensible" },

	--
	-- { "tpope/vim-repeat" },
}
