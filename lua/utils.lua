local cmd = vim.cmd
local keymap = vim.keymap

local M = {}

M.treesitter_languages = { "javascript", "typescript", "python", "cpp", "markdown", "latex" }
-- M.lsp_servers = { "clangd", "lua_ls", "pyright", "tsserver", "jdtls", "gopls", "texlab", "kotlin_language_server" }
M.lsp_servers = { "pyright", "ts_ls", "gopls", "lua_ls", "tinymist", "texlab" }

M.doc_mode = function(lang)
    cmd("set spell")
    cmd("set spelllang=" .. lang)
    vim.keymap.set("n", "<leader>s", "z=")
    vim.keymap.set({ "n", "i" }, "<C-l>", "<Esc>gqap")

    vim.opt.textwidth = 79
    vim.opt.wrap = false
    vim.opt.formatoptions = vim.opt.formatoptions + "t"
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
