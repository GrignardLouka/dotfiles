return { -- theme
	{ -- tiagovla/tokyodark.nvim
		"tiagovla/tokyodark.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			vim.cmd("colorscheme tokyodark")
		end,
	},

	-- show colors in nvim
	{ -- norcalli/nvim-colorizer.lua
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	},

	-- rainbow brackets
	{ -- HiPhish/rainbow-delimiters.nvim
		"HiPhish/rainbow-delimiters.nvim",

		config = function()
			local rainbow_delimiters = require("rainbow-delimiters")

			---@type rainbow_delimiters.config
			vim.g.rainbow_delimiters = {
				strategy = {
					[""] = rainbow_delimiters.strategy["global"],
					commonlisp = rainbow_delimiters.strategy["local"],
				},
				highlight = {
					-- "RainbowDelimiterRed",
					"RainbowDelimiterYellow",
					"RainbowDelimiterBlue",
					"RainbowDelimiterOrange",
					"RainbowDelimiterGreen",
					"RainbowDelimiterViolet",
					"RainbowDelimiterCyan",
				},
			}
		end,
	},

	-- indent visualizer
	{
		"lukas-reineke/indent-blankline.nvim",
		main = "ibl",
		---@module "ibl"
		---@type ibl.config
		opts = {},
	},

	-- Status bar
	{ -- nvim-lualine/lualine.nvim
		"nvim-lualine/lualine.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({})
		end,
	},

	-- show files in a tree
	{ -- nvim-neo-tree/neo-tree.nvim
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

	-- plugins to show git status of line in left bar
	{ -- lewis6991/gitsigns.nvim
		"lewis6991/gitsigns.nvim",
		config = function()
			local gitsigns = require("gitsigns")
			gitsigns.setup({
				signs = {
					add = { text = "+" },
					change = { text = "~" },
					delete = { text = "_" },
					topdelete = { text = "‾" },
					changedelete = { text = "~" },
				},
				signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
				numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
				linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
				word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
				watch_gitdir = {
					interval = 1000,
					follow_files = true,
				},
				attach_to_untracked = true,
				current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
				current_line_blame_opts = {
					virt_text = true,
					virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
					delay = 1000,
					ignore_whitespace = false,
				},
				current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
				sign_priority = 6,
				update_debounce = 100,
				status_formatter = nil, -- Use default
				max_file_length = 40000, -- Disable if file is longer than this (in lines)
				preview_config = {
					-- Options passed to nvim_open_win
					border = "single",
					style = "minimal",
					relative = "cursor",
					row = 0,
					col = 1,
				},
			})
		end,
	},

	-- show a visual atble with all possible key presses and their functions
	{ -- folke/which-key.nvim
		"folke/which-key.nvim",
		event = "VimEnter", -- Sets the loading event to 'VimEnter'
		opts = {
			icons = {
				-- set icon mappings to true if you have a Nerd Font
				mappings = vim.g.have_nerd_font,
				-- If you are using a Nerd Font: set icons.keys to an empty table which will use the
				-- default whick-key.nvim defined Nerd Font icons, otherwise define a string table
				keys = vim.g.have_nerd_font and {} or {
					Up = "<Up> ",
					Down = "<Down> ",
					Left = "<Left> ",
					Right = "<Right> ",
					C = "<C-…> ",
					M = "<M-…> ",
					D = "<D-…> ",
					S = "<S-…> ",
					CR = "<CR> ",
					Esc = "<Esc> ",
					ScrollWheelDown = "<ScrollWheelDown> ",
					ScrollWheelUp = "<ScrollWheelUp> ",
					NL = "<NL> ",
					BS = "<BS> ",
					Space = "<Space> ",
					Tab = "<Tab> ",
					F1 = "<F1>",
					F2 = "<F2>",
					F3 = "<F3>",
					F4 = "<F4>",
					F5 = "<F5>",
					F6 = "<F6>",
					F7 = "<F7>",
					F8 = "<F8>",
					F9 = "<F9>",
					F10 = "<F10>",
					F11 = "<F11>",
					F12 = "<F12>",
				},
			},

			-- Document existing key chains
			spec = {
				{ "<leader>c", group = "[C]ode", mode = { "n", "x" } },
				{ "<leader>d", group = "[D]ocument" },
				{ "<leader>s", group = "[S]earch" },
				{ "<leader>w", group = "[W]orkspace" },
				{ "<leader>t", group = "[T]rouble" },
				{ "<leader>l", group = "[L]aTeX" },
				{ "<leader>h", group = "Git [H]unk", mode = { "n", "v" } },
				{ "cs", group = "Change Surround" },
				{ "ci", group = "Change Inside" },
				{ "<leader>z", group = "[Z]en Mode" },
				{ "<leader>r", group = "[R]ename" },
				{ "[", group = "prev" },
				{ "]", group = "next" },
				{ "g", group = "goto" },
				{ "z", group = "Fold and Spelling" },
				{ "<leader>", group = "Leader" },
			},
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = true })
				end,
				desc = "Which Key Show All Posibilities",
			},
		},
	},

	-- zen mode
	{ -- folke/zen-mode.nvim
		"folke/zen-mode.nvim",
		config = function()
			vim.keymap.set("n", "<leader>zz", function()
				require("zen-mode").setup({
					window = {
						width = 100,
						options = {
							signcolumn = "yes",
							number = true,
							relativenumber = true,
							cursorline = false,
							colorcolumn = "0",
							wrap = true,
							-- foldcolumn = "0",
							-- list = false,
						},
					},
				})
				require("zen-mode").toggle()
				vim.wo.wrap = false
			end, { desc = "Zen Mode: Toggle with line numbers" })

			vim.keymap.set("n", "<leader>zZ", function()
				require("zen-mode").setup({
					window = {
						width = 120,
						options = {
							signcolumn = "no",
							number = false,
							relativenumber = false,
							cursorline = false,
							colorcolumn = "0",
							-- foldcolumn = "0",
							list = false,
							wrap = true,
						},
					},
				})
				require("zen-mode").toggle()
			end, { desc = "Zen Mode: Toggle without line numbers" })

			vim.keymap.set("n", "<leader>zr", function()
				require("zen-mode").setup({
					window = {
						width = 100,
						options = {
							signcolumn = "no",
							number = false,
							relativenumber = false,
							cursorline = false,
							colorcolumn = "0",
							foldcolumn = "0",
							list = false,
							wrap = true,
						},
					},
				})
				require("zen-mode").toggle()
			end, { desc = "Zen Mode: Reader mode" })
		end,
	},

	-- better bug list
	{ -- folke/trouble.nvim
		"folke/trouble.nvim",
		opts = {}, -- for default options, refer to the configuration section for custom setup.
		cmd = "Trouble",
		keys = {
			{
				"<leader>ta",
				"<cmd>Trouble diagnostics toggle<cr>",
				desc = "Trouble: Diagnostics",
			},
			{
				"<leader>tc",
				"<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
				desc = "Trouble: Buffer Diagnostics",
			},
			{
				"<leader>ts",
				"<cmd>Trouble symbols toggle focus=false<cr>",
				desc = "Trouble: Symbols",
			},
			{
				"<leader>tl",
				"<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
				desc = "Trouble: LSP Definitions / references / ...",
			},
			{
				"<leader>tL",
				"<cmd>Trouble loclist toggle<cr>",
				desc = "Trouble: Location List",
			},
			{
				"<leader>tQ",
				"<cmd>Trouble qflist toggle<cr>",
				desc = "Trouble: Quickfix List",
			},
		},
	},

	-- undo tree
	{
		"mbbill/undotree",

		config = function()
			vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle)
		end,
	},
}
