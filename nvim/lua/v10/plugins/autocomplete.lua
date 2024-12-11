-- ~/nvim/lua/v10/plugins/autocomplete.lua

return {
	-- copilot
	{
		"zbirenbaum/copilot.lua",
		cmd = "Copilot",
		event = "InsertEnter",
		config = function()
			require("copilot").setup({
				suggestion = { enabled = false },
				panel = { enabled = false },
			})
		end,
	},
	-- snippets

	-- autocomplete
	{ -- hrsh7th/nvim-cmp
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {

			{ -- L3MON4D3/LuaSnip
				"L3MON4D3/LuaSnip",
				version = "v2.*",
				build = "make install_jsregexp",

				dependancies = "rafamadriz/friendly-snippets",

				config = function()
					-- config
					require("luasnip").config.set_config({
						updateevents = "TextChanged, TextChangedI",
						enable_autosnippets = true,
					})

					-- load snippets
					require("luasnip.loaders.from_vscode").lazy_load()
					require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
				end,
			},
			{ -- windwp/nvim-autopairs
				"windwp/nvim-autopairs",
				event = "InsertEnter",
				config = function()
					-- setup
					require("nvim-autopairs").setup({
						disable_filetype = { "TelescopePrompt", "vim" },
						enable_check_bracket_line = false,
					})

					-- config
					local cmp_autopairs = require("nvim-autopairs.completion.cmp")
					require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
				end,
			},
			"hrsh7th/cmp-buffer", -- source for text in buffer
			"hrsh7th/cmp-path", -- source for file system paths
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lua",
			"micangl/cmp-vimtex",
			"saadparwaiz1/cmp_luasnip",
			"onsails/lspkind.nvim", -- vs-code like pictograms
			"zbirenbaum/copilot-cmp",
		},
		config = function()
			local cmp = require("cmp")
			local luasnip = require("luasnip")

			require("copilot_cmp").setup()

			cmp.setup({
				snippet = {
					expand = function(args)
						luasnip.lsp_expand(args.body)
					end,
				},

				mapping = cmp.mapping.preset.insert({
					["<C-d>"] = cmp.mapping.scroll_docs(-4),
					["<C-f>"] = cmp.mapping.scroll_docs(4),
					["<C-Space>"] = cmp.mapping.complete(),
					["<C-e>"] = cmp.mapping.close(),
					["<Tab>"] = cmp.mapping.confirm({
						behavior = cmp.ConfirmBehavior.Replace,
						select = true,
					}),
				}),

				sources = cmp.config.sources({ -- top ones are shown first
					{ name = "copilot" },
					{ name = "luasnip" },
					{ name = "nvim_lua" },
					{ name = "nvim_lsp" },
					{ name = "vimtex" },
					{ name = "buffer" },
					{ name = "path" },
				}),
			})

			vim.cmd([[
			    set completeopt=menuone,noinsert,noselect
			    highlight! default link CmpItemKind CmpItemMenuDefault
			  ]])
		end,
	},

	-- automatically complete pairs
}
