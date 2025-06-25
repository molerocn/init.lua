return {
    "folke/trouble.nvim",
    lazy = false,
    config = function()
        require("trouble").setup({
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
        })

        vim.keymap.set("n", "<leader>tr", "<cmd>Trouble diagnostics focus=true filter.severity=vim.diagnostic.severity.ERROR<cr>")
        vim.keymap.set("n", "<leader>tw", "<cmd>Trouble diagnostics focus=true<cr>")
    end,
}
