local v = vim

local M = {}

M.treesitter_languages = { "javascript", "typescript", "python", "cpp", "markdown" }
M.lsp_servers = { "pyright", "ts_ls", "gopls", "lua_ls", "tinymist" }

M.doc_mode = function(lang)
    lang = lang or "es" -- español por defecto
    v.schedule(function()
        v.opt_local.spell = true
        v.opt_local.spelllang = lang
        v.opt_local.textwidth = 79
        v.opt_local.wrap = false
        v.opt_local.formatoptions:append("t")

        v.keymap.set("n", "<leader>s", "z=", { buffer = true })
        v.keymap.set({ "n", "i" }, "<C-l>", "<Esc>gqap", { buffer = true })
        -- v.opt_local.foldcolumn = "9"
        -- v.opt_local.signcolumn = "yes:8"
    end)
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

M.remember_cursor_position = function()
    local last_pos = v.fn.line([['"]])
    if last_pos > 0 and last_pos <= v.fn.line("$") then
        v.schedule(function()
            v.cmd('normal! g`"zz')
        end)
    end
end

-- M.remember_cursor_position = function()
--     local last_pos = v.fn.line("''")
--     if last_pos > 0 and last_pos <= v.fn.line("$") then
--         v.schedule(function()
--             pcall(v.cmd, 'normal! g`\'zz') 
--         end)
--     end
-- end

M.yank_as_paragraph = function()
    vim.cmd('normal! Jgv"+yu')
    vim.schedule(function()
        print("Paragraph yanked")
    end)
end

return M

-- M.duplicate_current_file = function()
--     local filename_with_extension = v.fn.expand("%:t")
--     v.cmd("saveas %:h/cp-" .. filename_with_extension)
-- end

