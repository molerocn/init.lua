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
            transparent = false,
        })
        vim.cmd.colorscheme("catppuccin")
    end,
}
