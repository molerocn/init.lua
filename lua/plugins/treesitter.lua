return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        lazy = false,
        config = function()
            local configs = require("nvim-treesitter.configs")
            local treesitter_languages = require("utils").treesitter_languages

            configs.setup({
                ensure_installed = treesitter_languages,
                sync_install = false,
                highlight = { enable = true },
                indent = { enable = true },
            })
        end,
    },
}
