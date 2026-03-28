return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        "ray-x/lsp_signature.nvim",
        "williamboman/mason-lspconfig.nvim",
        "williamboman/mason.nvim" 
    },
    keys = {
        { "<leader>f", function()
            vim.lsp.buf.format({ async = true })
        end },
        { '[d', vim.diagnostic.goto_prev },
        { ']d', vim.diagnostic.goto_next }
    },
    config = function()
        local lsp_servers = { "basedpyright" } 

        require("lsp_signature").setup()
        require("mason").setup()
        require("mason-lspconfig").setup({ ensure_installed = lsp_servers })

        for _, lsp in ipairs(lsp_servers) do
            vim.lsp.enable(lsp)
        end

        vim.diagnostic.config({
            float = {
                source = "always",
                border = "rounded",
            },
        })
    end,
}
