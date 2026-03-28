return {
    "tpope/vim-fugitive",
    lazy = false,
    keys = {
        { "gs", function()
            vim.cmd("Git")
            vim.schedule(function() vim.cmd('normal! 4j') end)
        end },
        { "<leader>gp", "<cmd>Git push<CR>" },
        { "<leader>gl", "<cmd>Git log --oneline --decorate --graph --all<CR>" },
        { "<leader>gv", "<cmd>diff<CR>" },
        { "gu", "<cmd>diffget //2<CR>" },
        { "gh", "<cmd>diffget //3<CR>" },
    }
}
