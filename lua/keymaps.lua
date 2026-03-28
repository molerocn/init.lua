vim.g.mapleader = " "

local session = "tmux neww ~/personal/.dotfiles/bin/tmux-sessionizer<CR>"
local notebook = "tmux neww ~/personal/.dotfiles/bin/notebook<CR>"

vim.keymap.set("v", "H", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "M", ":m '>+1<CR>gv=gv")
vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("x", "p", [["_dP]])
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR><C-w>h<C-w>k")
vim.keymap.set("i", "<C-Backspace>", "<C-w>")
vim.keymap.set("i", "<C-h>", "<C-w>")
vim.keymap.set("n", "<C-]>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<C-b>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<leader>d", "dd<cmd>w<CR>")
vim.keymap.set("n", "<leader>v", "<cmd>Ex<cr>2j")
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set({ "n", "i", "v" }, "<C-s>", "<Esc><cmd>w<CR>")
vim.keymap.set("n", "<C-f>", "<Esc><cmd>silent !" .. session)
vim.keymap.set("n", "<C-g>", "<Esc><cmd>silent !" .. notebook)
vim.keymap.set({"n", "i"}, "<C-z>", "<Esc><cmd>q<CR>")
vim.keymap.set({"n", "v"}, "s", "<Esc><cmd>w<CR>")
