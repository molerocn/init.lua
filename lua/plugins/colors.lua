return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    dependencies = {
        "craftzdog/solarized-osaka.nvim"
    },
    config = function()
        require("rose-pine").setup({
            -- disable_background = true,
            styles = { italic = false }
        })
        require("solarized-osaka").setup({
            transparent = false
        })
        vim.cmd.colorscheme("solarized-osaka")
    end,
}
