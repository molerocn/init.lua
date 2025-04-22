return {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
        "projekt0n/github-nvim-theme",
        "catppuccin/nvim"
    },
    config = function()
        require("catppuccin").setup({});
        require("solarized-osaka").setup({
            transparent = true,
        })
        vim.cmd.colorscheme("solarized-osaka")
    end,
}
