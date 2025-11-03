return {
    "tpope/vim-fugitive",
    lazy = false,
    config = function()
        vim.keymap.set("n", "gs", function()
            vim.cmd("Git")
            vim.schedule(function()
                vim.cmd('normal! 4j')
            end)
        end)
        vim.keymap.set("n", "<leader>gp", "<cmd>Git push<CR>")
        vim.keymap.set("n", "<leader>gl", "<cmd>Git log --oneline --decorate --graph --all<CR>")
        vim.keymap.set("n", "<leader>gv", "<cmd>diff<CR>")
        vim.keymap.set("n", "gu", "<cmd>diffget //2<CR>")
        vim.keymap.set("n", "gh", "<cmd>diffget //3<CR>")
    end,
}
