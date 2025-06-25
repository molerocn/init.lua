local cmd = vim.cmd
local keymap = vim.keymap

local M = {}

M.treesitter_languages = { "javascript", "typescript", "python", "cpp", "markdown", "astro" }
-- M.lsp_servers = { "clangd", "lua_ls", "pyright", "tsserver", "jdtls", "gopls", "texlab", "kotlin_language_server" }
M.lsp_servers = { "pyright", "ts_ls", "gopls", "lua_ls", "tinymist" }

M.doc_mode = function()
    cmd("set wrap linebreak")
    cmd("set breakindent")
    keymap.set("v", "k", "gk")
    keymap.set("v", "j", "gj")
    keymap.set("n", "k", "gk")
    keymap.set("n", "j", "gj")

    cmd("set spell")
    cmd("set spelllang=es")
    keymap.set("n", "<leader>s", "z=")

    -- Scroll visualmente media "pantalla" hacia abajo
    keymap.set("n", "<C-d>", function()
        cmd("normal! " .. math.floor(vim.o.scroll / 2 + 10) .. "gjzz")
    end, { noremap = true, silent = true })

    -- Scroll visualmente media "pantalla" hacia arriba
    keymap.set("n", "<C-u>", function()
        cmd("normal! " .. math.floor(vim.o.scroll / 2 + 10) .. "gkzz")
    end, { noremap = true, silent = true })
end

return M
