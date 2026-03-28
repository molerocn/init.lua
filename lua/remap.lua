local v = vim
local keymap = v.keymap

v.g.mapleader = " "
keymap.set("v", "H", ":m '<-2<CR>gv=gv")
keymap.set("v", "M", ":m '>+1<CR>gv=gv")
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("x", "p", [["_dP]])
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("i", "<C-c>", "<Esc>")
keymap.set({ "n", "i" }, "<C-f>", "<Esc><cmd>silent !tmux neww ~/personal/.dotfiles/tmux/tmux-sessionizer<CR>")
keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR><C-w>h<C-w>k")
keymap.set("i", "<C-BS>", "<C-w>")
keymap.set("i", "<C-h>", "<C-w>")
keymap.set("n", "<C-]>", "<cmd>cprev<CR>zz")
keymap.set("n", "<C-b>", "<cmd>cnext<CR>zz")
keymap.set("n", "<leader>v", "<cmd>Ex<cr>2j")

-- bad keymaps I think
-- keymap.set({ "n", "v" }, "s", "<Esc><cmd>w<CR>")
-- keymap.set({ "n", "i" }, "<C-s>", "<Esc><cmd>w<CR>")
-- keymap.set("n", "<leader>d", "VD<cmd>w<CR>")
-- keymap.set("n", "vap", "vip")
-- keymap.set("n", "vip", "vap")
-- keymap.set("n", '<C-o>', '<C-o>zz')
-- keymap.set("n", '<C-i>', '<C-i>zz')
-- keymap.set("n", "<C-d>", "<C-d>zz")
-- keymap.set("n", "<C-u>", "<C-u>zz")

-- disable some keymaps
-- keymap.set("n", "H", "<nop>")
-- keymap.set("n", "L", "<nop>")
-- keymap.set("v", "N", "<nop>")
-- keymap.set("n", "(", "<nop>")
-- keymap.set("n", ")", "<nop>")
-- keymap.set("i", "<C-r>", "<nop>")
-- keymap.set("i", "<C-b>", "<nop>")
-- keymap.set("v", 'q', '<nop>')
-- keymap.set("v", "K", "<nop>")
