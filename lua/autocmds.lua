vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('molerocn-highlight-yank', { clear = true }),
    callback = function() vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 }) end,
})
