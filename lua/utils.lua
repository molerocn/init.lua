local v = vim
local M = {}

M.treesitter_languages = { "python", "markdown", "lua" }
M.lsp_servers = { "basedpyright" }

M.remember_cursor_position = function()
    local last_pos = v.fn.line([['"]])
    if last_pos > 0 and last_pos <= v.fn.line("$") then
        v.schedule(function()
            v.cmd('normal! g`"zz')
        end)
    end
end

return M
