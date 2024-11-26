-- [[ Basic Keymaps ]]
local map = vim.keymap.set
local del = vim.keymap.del

--------------------------- MOVEMENT ------------------------------------------
-- better up/down
map({ "n", "x" }, "j", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "<Down>", "v:count == 0 ? 'gj' : 'j'", { desc = "Down", expr = true, silent = true })
map({ "n", "x" }, "k", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })
map({ "n", "x" }, "<Up>", "v:count == 0 ? 'gk' : 'k'", { desc = "Up", expr = true, silent = true })

--  Use CTRL+<hjkl> to switch between windows
map("n", "<C-h>", "<C-w>h", { desc = "Move focus to the left window" })
map("n", "<C-t>", "<C-w>l", { desc = "Move focus to the right window" })
map("n", "<C-l>", "<C-w>l", { desc = "Move focus to the right window" })
map("n", "<C-j>", "<C-w>j", { desc = "Move focus to the lower window" })
map("n", "<C-k>", "<C-w>k", { desc = "Move focus to the upper window" })

-- Resize window using <ctrl> arrow keys
map("n", "<C-Up>", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map("n", "<C-Down>", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map("n", "<C-Left>", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map("n", "<C-Right>", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })

-- Move Lines
map("n", "<A-j>", "<cmd>execute 'move .+' . v:count1<cr>==", { desc = "Move Down" })
map("n", "<A-k>", "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = "Move Up" })
map("i", "<A-j>", "<esc><cmd>m .+1<cr>==gi", { desc = "Move Down" })
map("i", "<A-k>", "<esc><cmd>m .-2<cr>==gi", { desc = "Move Up" })
map("v", "<A-j>", ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = "Move Down" })
map("v", "<A-k>", ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = "Move Up" })

-- buffers
map("n", "<S-h>", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "<S-l>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<S-t>", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "[b", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "]b", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "<leader>bb", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>`", "<cmd>e #<cr>", { desc = "Switch to Other Buffer" })
map("n", "<leader>bd", ":bd<cr>", { desc = "Delete Buffer" })
map("n", "<leader>bD", "<cmd>:bd<cr>", { desc = "Delete Buffer and Window" })

-- Clear search with <esc>
map({ "i", "n" }, "<esc>", "<cmd>noh<cr><esc>", { desc = "Escape and Clear hlsearch" })

-- commenting
map("n", "gco", "o<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Below" })
map("n", "gcO", "O<esc>Vcx<esc><cmd>normal gcc<cr>fxa<bs>", { desc = "Add Comment Above" })

map("n", "<leader>o", ":", { desc = "Open Cmd" })
map("n", "<leader>dw", ":w!<CR>", { desc = "Save Document" })
map("n", "<leader>dq", ":wq!<CR>", { desc = "Save And Quit Document" })
map("n", "<leader>dx", ":q!<CR>", { desc = "Quit Document" })

-- Make "l" acts like "t" due to dvorak layout, allows up down left right on both hands
-- vim.keymap.del("n", "t")
map({ "n", "x" }, "t", "l", { remap = true })

-- Diagnostic keymaps
map("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- toggle neotree with space e
map("n", "<leader>e", ":Neotree toggle<cr>", { desc = "Neotree: Toggle" })

-- tab through buffers

-- stay in visual mode after indent
map("v", "<", "<gv")
map("v", ">", ">gv")

-- when pasting over text in visual mode, hold on to previous paste
map("v", "p", '"_dP')

-- remap () and {} to g
-- map("n", "gp", "}", { desc = "Goto next paragraph" })
-- map("n", "gP", "{", { desc = "Goto previous paragraph" })

-- DISABLE UNUSED KEYMAPS
del("n", "gc")
map("n", "gn", "<ESC>", { desc = "which_key_ignore" })
map("n", "gN", "<ESC>", { desc = "which_key_ignore" })
map("n", "gw", "<ESC>", { desc = "which_key_ignore" })
map("n", "gt", "<ESC>", { desc = "which_key_ignore" })
map("n", "gT", "<ESC>", { desc = "which_key_ignore" })
