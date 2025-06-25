local keymap = vim.keymap
local utils = require("utils")

vim.g.mapleader = " "
keymap.set("v", "K", "k")
keymap.set("v", "J", "j")
keymap.set("v", "M", ":m '<-2<CR>gv=gv")
keymap.set("v", "B", ":m '>+1<CR>gv=gv")
keymap.set("v", "W", "<nop>")
keymap.set("n", "J", "mzJ`z")
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")
keymap.set("n", "n", "nzzzv")
keymap.set("n", "N", "Nzzzv")
keymap.set("x", "<leader>pp", [["_dP]])
keymap.set({ "n", "v" }, "<leader>y", [["+y]])
keymap.set("i", "<C-c>", "<Esc>")
keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmux-sessionizer<CR>")
keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR><C-w>h<C-w>k")
keymap.set("n", " ", ",")
keymap.set("i", "<C-BS>", "<C-w>")
keymap.set("i", "<C-h>", "<C-w>")
keymap.set("n", "<C-]>", "<cmd>cprev<CR>zz")
keymap.set("n", "<C-b>", "<cmd>cnext<CR>zz")
keymap.set("n", "H", "<nop>")
keymap.set("n", "L", "<nop>")
keymap.set("v", "N", "<nop>")
keymap.set("i", "<C-v>", "<C-S-v>")
keymap.set({ "n", "v" }, "s", "<Esc><cmd>w<CR>")
keymap.set({ "n" }, "<C-s>", "<Esc><cmd>w<CR>")
keymap.set("n", "<C-_>", "<Esc><cmd>silent !tmux select-window -t 2<CR>")
keymap.set("n", "<leader>z", "<cmd>qa!<CR>")
keymap.set("n", "(", "<nop>")
keymap.set("n", ")", "<nop>")
keymap.set("n", "<leader>d", "VD<cmd>w<CR>")
keymap.set("n", "<leader>ce", "VC")
keymap.set("i", "<C-r>", "<nop>")
keymap.set("i", "<C-b>", "<nop>")
keymap.set("v", 'q', '<nop>')
keymap.set("n", '<C-o>', '<C-o>zz')
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
keymap.set({ "n", "i" }, "<C-l>", "<Esc>A;<Esc>:w<CR>")
keymap.set("n", "<leader>o", "o<C-c>")
keymap.set("n", "<leader>O", "O<C-c>")

keymap.set("n", "cie", 'ci"')
keymap.set("n", "yie", 'yi"')
keymap.set("n", "die", 'di"')
keymap.set("n", "vie", 'vi"')

keymap.set("n", "dte", 'dt"')

keymap.set('n', '<leader>rc',
    'ipackage <CR><CR>public class Template {<CR><CR>public Template() {<CR>}<CR>}<Esc>:%s/Template/')
keymap.set("n", "<leader>v", "<cmd>Ex<CR>2j")

keymap.set("n", "<leader>xd", function()
    require("cellular-automaton").start_animation("make_it_rain")
end)

keymap.set("n", "<leader>ww", utils.doc_mode)

vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
    pattern = "*.d2",
    callback = function()
        vim.keymap.set("n", "<leader>pr", function()
            local current_file = vim.fn.expand("%:p") -- ruta absoluta
            local file_name = vim.fn.expand("%:t")
            local output_file = ".trash/" .. file_name .. ".svg"
            -- print("Watching " .. current_file .. "...")
            vim.fn.jobstart({ "d2", "--layout=TALA", "--watch", current_file, output_file }, {
                stdout_buffered = false,
                stderr_buffered = false,
                on_stdout = function() end,
                on_stderr = function() end,
            })
        end, { desc = "Watch D2 diagram", noremap = true, silent = true })
    end,
})
