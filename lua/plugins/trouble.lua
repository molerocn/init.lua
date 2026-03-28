return {
    "folke/trouble.nvim",
    opts = {},
    cmd = "Trouble",
    keys = {
        { "<leader>tr", "<cmd>Trouble diagnostics focus=true filter.severity=vim.diagnostic.severity.ERROR<cr>"},
        { "<leader>tw", "<cmd>Trouble diagnostics focus=true<cr>" },
    }
}
