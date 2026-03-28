vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('molerocn-highlight-yank', { clear = true }),
    callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 }) end,
})

-- Remember cursor position
local session_positions = {}
vim.api.nvim_create_autocmd("BufLeave", {
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        session_positions[bufnr] = vim.api.nvim_win_get_cursor(0)
    end,
})
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local bufnr = vim.api.nvim_get_current_buf()
        local last_pos = session_positions[bufnr]

        if last_pos then
            vim.schedule(function()
                if last_pos[1] <= vim.api.nvim_buf_line_count(bufnr) then
                    vim.api.nvim_win_set_cursor(0, last_pos)
                    vim.cmd('normal! zz')
                end
            end)
        end
    end,
})
