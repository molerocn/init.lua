return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    dependencies = {
        "rebelot/kanagawa.nvim",
        "projekt0n/github-nvim-theme"
    },
    config = function()
        vim.cmd.colorscheme("kanagawa")
        function Transparent()
            require("kanagawa").setup({
                transparent = true,
            })
            vim.cmd.colorscheme("kanagawa")
        end
    end,
}
