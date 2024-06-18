return {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
        "L3MON4D3/LuaSnip",
    },
    config = function()
        local ls = require("luasnip")
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }

        vim.keymap.set({ "i", "s" }, "<C-e><Tab>", function() ls.jump(1) end, { silent = true })
        vim.keymap.set({ "i", "s" }, "<C-e>,", function() ls.jump(-1) end, { silent = true })

        cmp.setup({
            snippet = {
                expand = function(args)
                    ls.lsp_expand(args.body)
                end,
            },
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
            }),
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<Tab>"] = cmp.mapping.confirm({ select = true }),
                ['.'] = function(fallback)
                    if cmp.visible() then
                        cmp.confirm({ select = true })
                        vim.api.nvim_feedkeys('.', 'n', true)
                    else
                        fallback() -- Si no hay sugerencia visible, solo escribe un punto
                    end
                end,
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-y>"] = cmp.config.disable,
            }),
            completion = { completeopt = "menu,menuone,noinsert" },
        })
    end,
}
