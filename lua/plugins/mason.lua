return {
    "williamboman/mason.nvim",
    lazy = false,
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    dependencies = { "williamboman/mason-lspconfig.nvim" },
    config = function()
        local lsp_servers = require("utils").lsp_servers
        require("mason").setup()
        require("mason-lspconfig").setup({ ensure_installed = lsp_servers })
    end,
}
