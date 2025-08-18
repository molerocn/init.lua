local cmd = vim.cmd
local keymap = vim.keymap

local M = {}

M.treesitter_languages = { "javascript", "typescript", "python", "cpp", "markdown", "latex" }
-- M.lsp_servers = { "clangd", "lua_ls", "pyright", "tsserver", "jdtls", "gopls", "texlab", "kotlin_language_server" }
M.lsp_servers = { "pyright", "ts_ls", "gopls", "lua_ls", "tinymist", "sqls", "texlab" }

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

M.get_system_theme = function()
    local handle = io.popen("gsettings get org.gnome.desktop.interface color-scheme")
    if handle == nil then return "light" end
    local result = handle:read("*a")
    handle:close()

    if result:match("dark") then
        return "dark"
    else
        return "light"
    end
end

return M
