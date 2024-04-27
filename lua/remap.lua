local keymap = vim.keymap

vim.g.mapleader = ","
keymap.set("v", "K", "k")
keymap.set("v", "J", "j")
keymap.set("v", "P", ":m '<-2<CR>gv=gv")
keymap.set("v", "E", ":m '>+1<CR>gv=gv")
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("x", "p", [["_dP]])
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>")
keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR><C-w>h<C-w>k")
keymap.set("n", "<Tab>", ";")
keymap.set("n", " ", ",")
keymap.set("i", "<C-BS>", "<C-w>")
keymap.set("i", "<C-h>", "<C-w>")
keymap.set("n", "<C-k>", "<cmd>cprev<CR>zz")
keymap.set("n", "<C-j>", "<cmd>cnext<CR>zz")
keymap.set({ "n", "v" }, "s", "<Esc><cmd>w<CR>")
keymap.set("v", "W", "<nop>")
keymap.set("v", "N", "<nop>")
keymap.set("n", "<leader>v", "<cmd>Ex<CR>2j")
keymap.set("i", "<C-v>", "<nop>")
keymap.set({ "n", "v", "i" }, "<C-s>", "<Esc><cmd>w<CR>")
keymap.set({ "i", "n" }, "<C-l>", "<Esc>A;<Esc><cmd>w<CR>")
keymap.set("n", "<C-z>", "<cmd>q<CR>")
keymap.set("n", "<leader>z", "<cmd>qa!<CR>")
keymap.set("i", "<C-r>", "<Esc>O")
keymap.set("n", "<leader>d", "dd<cmd>w<CR>")





