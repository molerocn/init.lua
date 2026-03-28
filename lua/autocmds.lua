vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('molerocn-highlight-yank', { clear = true }),
    callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 }) end,
})

vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local last_pos = vim.fn.line([['"]])
        if last_pos > 0 and last_pos <= vim.fn.line("$") then
            vim.schedule(function() vim.cmd('normal! g`"zz') end)
        end
    end
})
