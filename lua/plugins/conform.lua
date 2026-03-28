return {
    'stevearc/conform.nvim',
    lazy = false,
    opts = {
        formatters_by_ft = {
            python = { "ruff" },
        },
        format_on_save = {
            timeout_ms = 500,
            lsp_format = "fallback",
        },
    },
}
