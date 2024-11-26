-- ~/.config/nvim/lua/v10/plugins/vimtex.lua
return {
	"lervag/vimtex",
	lazy = false, -- we don't want to lazy load VimTeX
	-- tag = "v2.15", -- uncomment to pin to a specific release
	init = function()
		-- VimTeX configuration goes here, e.g.
		vim.g.vimtex_view_method = "zathura"
		vim.g.vimtex_compiler_latexmk = {
			out_dir = "build",
			-- callback = false,
		}
		vim.g.vimtex_imaps_enabled = false
		vim.g.vimtex_format_enabled = true
		-- vim.g.vimtex
		--
		vim.g.vimtex_quickfix_ignore_filters = { "Overfull" }
	end,
}
