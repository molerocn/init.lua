return {
    "folke/trouble.nvim",
    lazy = false,
    opts = {
        icons = {},
        fold_open = "-",
        fold_closed = "+",
        indent_lines = false,
        signs = {
            error = "E",
            warning = "W",
            hint = "H",
            information = "I"
        },
        use_diagnostic_signs = false
    },
    keys = {
        { "<leader>tr", "<cmd>Trouble diagnostics focus=true filter.severity=vim.diagnostic.severity.ERROR<cr>"},
        { "<leader>tw", "<cmd>Trouble diagnostics focus=true<cr>" },
    }
}
