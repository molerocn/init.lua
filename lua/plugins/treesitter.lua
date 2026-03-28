return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    config = function()
        local configs = require("nvim-treesitter")

        configs.setup({
            ensure_installed = require("utils").treesitter_languages,
            sync_install = false,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
