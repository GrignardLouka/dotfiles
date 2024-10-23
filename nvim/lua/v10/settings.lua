local opt = vim.opt
local o = vim.o
local g = vim.g
--
--  NOTE: Must happen before plugins are loaded (otherwise wrong leader will be used)
g.mapleader = " "
g.maplocalleader = " "

--------------- [[System settings]] --------------
opt.backup = false -- don't make backups
opt.conceallevel = 0 -- open with fold level 0
opt.swapfile = false -- keep swapfile of buffers

opt.hlsearch = true -- show search upon typing
opt.inccommand = "split" -- Preview substitutions live, as you type!

g.have_nerd_font = true -- use nerdfont
opt.spellfile = vim.fn.stdpath("config") .. "/spell/en-US.utf-8.add" -- location of spelling file

-- Sync clipboard between OS and Neovim.
--  Schedule the setting after `UiEnter` because it can increase startup-time.
vim.schedule(function()
	opt.clipboard = "unnamedplus"
end)

-- Save undo history
opt.undofile = true

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
opt.ignorecase = true
opt.smartcase = true

-- Decrease update time
opt.updatetime = 250

-- Decrease mapped sequence wait time (display whichkey quicker)
opt.timeoutlen = 300

-- -- Configure how new splits should be opened
-- opt.splitright = true
-- opt.splitbelow = true

--------------- [[UI settings]] --------------
opt.number = true
opt.relativenumber = true

-- allow the use of a mouse
opt.mouse = "a"

-- Status bar
opt.showmode = false -- Don't show the mode, since it's already in the status line
opt.laststatus = 3

opt.breakindent = true -- wrapped lines will have same indent

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Sets how neovim will display certain whitespace characters in the editor.
-- opt.list = true
-- opt.listchars = { tab = "| ", trail = "·", nbsp = "␣" }

-- Show which line your cursor is on
opt.cursorline = true

-- Minimal number of screen lines to keep above and below the cursor.
opt.scrolloff = 10

-- These options are replaced by tpope/vim-sleuth
opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4

-- Fold settings
opt.foldmethod = "expr"
opt.foldexpr = "v:lua.vim.treesitter.foldexpr()"
opt.foldcolumn = "0"
opt.foldtext = ""
opt.foldlevelstart = 1
opt.foldnestmax = 5

-- oldschool vim commands
vim.cmd("set whichwrap+=<,>,[,],h,l") -- make motions move to othe	r lines
vim.cmd("set iskeyword+=-") -- words seperated by a dash are treated as 1 word
