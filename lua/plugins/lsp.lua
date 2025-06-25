return {
    "neovim/nvim-lspconfig",
    lazy = false,
    dependencies = {
        "ray-x/lsp_signature.nvim",
        "nvim-java/nvim-java",
        "mfussenegger/nvim-jdtls",
    },
    config = function()
        local keymap = vim.keymap
        local cmd = vim.cmd

        local utils = require("utils")
        local lspconfig = require("lspconfig")
        local jdtls = require("jdtls")

        require("java").setup()
        require("lsp_signature").setup()

        lspconfig.jdtls.setup({
            on_attach = function(client, bufnr)
                keymap.set("n", "<leader>jo", function()
                    jdtls.organize_imports()
                end)
                keymap.set("n", "<leader>jt", function()
                    jdtls.tests.go_to_subject()
                end)
            end
        })
        lspconfig.tinymist.setup({
            settings = {
                formatterMode = "typstyle",
            },
            on_attach = function(client, bufnr)
                keymap.set("n", "<leader>ts", function()
                    client:exec_cmd({
                        title = "pin",
                        command = "tinymist.pinMain",
                        arguments = { vim.api.nvim_buf_get_name(0) },
                    }, { bufnr = bufnr })
                    cmd("TypstPreview")
                    utils.doc_mode()
                end, { desc = "[T]inymist [P]in", noremap = true })

                keymap.set("n", "<leader>tu", function()
                    client:exec_cmd({
                        title = "unpin",
                        command = "tinymist.pinMain",
                        arguments = { vim.v.null },
                    }, { bufnr = bufnr })
                end, { desc = "[T]inymist [U]npin", noremap = true })
            end,
        })

        -- linea para poder mostrar los diagnostic en tiempo real
        vim.diagnostic.config({
            virtual_text = {
                prefix = ' ■ '
            },
            update_in_insert = true
        })

        for _, lsp in ipairs(utils.lsp_servers) do
            vim.lsp.enable(lsp)
        end

        keymap.set('n', '[d', vim.diagnostic.goto_prev)
        keymap.set('n', ']d', vim.diagnostic.goto_next)

        vim.api.nvim_create_autocmd("LspAttach", {
            group = vim.api.nvim_create_augroup("UserLspConfig", {}),
            callback = function(ev)
                vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

                local opts = { buffer = ev.buf }
                keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
                keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                keymap.set("n", "K", vim.lsp.buf.hover, opts)
                keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
                keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, opts)
                keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, opts)
                keymap.set("n", "<leader>wl", function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, opts)
                keymap.set("n", "<leader>re", vim.lsp.buf.rename, opts)
                keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
                keymap.set("n", "gr", vim.lsp.buf.references, opts)
                keymap.set('n', '<leader>f', function()
                    vim.lsp.buf.format { async = true }
                end, opts)
            end,
        })
    end,
}
