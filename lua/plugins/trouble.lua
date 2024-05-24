return {
    "folke/trouble.nvim",
    lazy = false,
    config = function()
        require("trouble").setup({
            icons = false,
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

        vim.keymap.set("n", "<leader>tr", "<cmd>TroubleToggle<cr>")
    end,
}
