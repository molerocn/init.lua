return {
    "hrsh7th/nvim-cmp",
    lazy = false,
    dependencies = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-path",
    },
    opts = function()
        local cmp = require("cmp")
        local cmp_select = { behavior = cmp.SelectBehavior.Select }
        return {
            sources = cmp.config.sources({
                { name = "nvim_lsp" },
                { name = "path" },
            }),
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"] = cmp.mapping.select_prev_item(cmp_select),
                ["<C-n>"] = cmp.mapping.select_next_item(cmp_select),
                ["<C-Space>"] = cmp.mapping.complete(),
            }),
            completion = { completeopt = "menu,menuone,noinsert" },
        }
    end
}
