return {
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        cmd = { "TSInstall", "TSBufEnable", "TSBufDisable", "TSModuleInfo" },
        init = function()
            require("utils").lazy_load("nvim-treesitter")
        end,
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
    {
        "nvim-treesitter/nvim-treesitter-context",
        init = function()
            require("utils").lazy_load("nvim-treesitter-context")
        end,
        config = function()
            require("treesitter-context").setup()
        end,
    }
}
