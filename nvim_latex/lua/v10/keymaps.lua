-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.keymap.set("n", "t", "l")

-- MY PERSONAL KEYBINDS
vim.keymap.set("n", "<C-Tab>", "gt", { desc = "go to next tab" })
vim.keymap.set("n", "<C-S-Tab>", "gT", { desc = "go to next tab" })

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

--  Use CTRL+<hjkl> to switch between windows
vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-t>", "<C-w>l", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })

-- toggle neotree with space e
vim.keymap.set("n", "<leader>e", ":Neotree toggle<cr>")

-- Resize window with ctrl
vim.keymap.set("n", "<C-Up>", ":resize +2<cr>")
vim.keymap.set("n", "<C-Down>", ":resize -2<cr>")
vim.keymap.set("n", "<C-Left>", ":vertical resize -2<cr>")
vim.keymap.set("n", "<C-Right>", ":vertical resize +2<cr>")

-- tab through buffers
vim.keymap.set("n", "<S-l>", ":bnext<cr>")
vim.keymap.set("n", "<S-t>", ":bnext<cr>")
vim.keymap.set("n", "<S-h>", ":bprevious<cr>")

-- stay in visual mode after indent
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Move selected text
vim.keymap.set("v", "<A-k>", ":m .-2<cr>gv")
vim.keymap.set("v", "<A-j>", ":m .+1<cr>gv")
-- move selected text in visual block mode
vim.keymap.set("x", "<A-j>", ":move '>+1<CR>gv-gv")
vim.keymap.set("x", "<A-k>", ":move '<-2<CR>gv-gv")

-- when pasting over text in visual mode, hold on to previous paste
vim.keymap.set("v", "p", '"_dP')
