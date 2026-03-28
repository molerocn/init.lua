local utils = require("utils")
local v = vim

local api = v.api
local opt = v.opt
local cmd = v.cmd

-- opt.guicursor = ""
opt.cursorline = true
opt.nu = true
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50
opt.colorcolumn = "80"
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true
-- opt.cursorline = true

-- netrw
v.g.netrw_browse_split = 0
v.g.netrw_banner = 0
v.g.netrw_winsize = 25

-- disable some default keymaps
-- cmd("au FileType netrw nmap <buffer> v <nop>")
-- cmd("au FileType netrw nmap <buffer> s <nop>")
-- cmd("au FileType netrw nmap <buffer> o <nop>")
-- cmd("au FileType netrw nmap <buffer> t <nop>")
-- cmd("au FileType netrw nmap <buffer> p <nop>")
-- cmd("au FileType netrw nmap <buffer> u <nop>")
-- cmd("au FileType netrw nmap <buffer> i <nop>")

-- custom keymaps
-- cmd("au FileType netrw nmap <buffer> a %")
-- cmd("au FileType netrw nmap <buffer> r R")
-- cmd("au FileType netrw nmap <buffer> <BS> -")
-- cmd("au FileType netrw nmap <buffer> l <CR>")

-- yank animation
api.nvim_create_autocmd('TextYankPost', {
    group = api.nvim_create_augroup('molerocn-highlight-yank', { clear = true }),
    callback = function()
        v.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
    end,
})

-- eliminar el formateo continuo en comentarios
-- api.nvim_create_autocmd("FileType", {
--     pattern = "*",
--     callback = function()
--         v.opt_local.formatoptions:remove({ "c", "r", "o" })
--     end,
-- })

api.nvim_create_autocmd("BufReadPost", {
    callback = utils.remember_cursor_position
})

-- api.nvim_create_autocmd("FileType", {
--     pattern = "sql",
--     callback = function()
--         vim.g.omni_sql_no_default_maps = 0
--         v.keymap.set("n", "<C-S>", "<C-c>", { buffer = true })
--     end,
-- })
