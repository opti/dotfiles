-- set leader key to space
vim.g.mapleader = " "

local keymap = vim.keymap -- for conciseness

--------------------- General Keymaps -------------------

-- use jk to exit insert mode
-- keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode with jk" })

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { silent = true, desc = "Clear search highlights" })
keymap.set("n", "<CR>", ":noh<CR><CR>", { silent = true, desc = "Clear search highlights on Enter" })

-- delete without copying into register
keymap.set({ "n", "v" }, "x", '"_x')
keymap.set({ "n", "v" }, "d", '"_d')

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>f", ":b#<cr>", { silent = true, desc = "Switch between two recent buffers" })
keymap.set("n", "<leader>w", ":bd<cr>", { silent = true, desc = "Delete current buffer" })

keymap.set("n", "<C-j>", " <C-w>j") -- Navigate easier between panes
keymap.set("n", "<C-k>", " <C-w>k") -- Navigate easier between panes
keymap.set("n", "<C-h>", " <C-w>h") -- Navigate easier between panes
keymap.set("n", "<C-l>", " <C-w>l") -- Navigate easier between panes

keymap.set("n", "<C-Down>", " <C-w>j") -- Navigate easier between panes
keymap.set("n", "<C-Up>", " <C-w>k") -- Navigate easier between panes
keymap.set("n", "<C-Left>", " <C-w>h") -- Navigate easier between panes
keymap.set("n", "<C-Right>", " <C-w>l") -- Navigate easier between panes

-- Remap for dealing with word wrap
keymap.set("n", "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
keymap.set("n", "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Gist
keymap.set(
  "n",
  "<leader>hh",
  "<cmd>GistCreate from vim<cr>",
  { silent = true, desc = "Create a GitHub gist from current buffer" }
)
keymap.set("v", "<leader>hh", "<cmd>GistCreate from vim<cr>", { desc = "Create a GitHub gist from selection" })
