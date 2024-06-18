return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    dependencies = {
        "ellisonleao/gruvbox.nvim",
        "projekt0n/github-nvim-theme"
    },
    config = function()
        require("gruvbox").setup()
        require("rose-pine").setup({
            disable_background = true,
            styles = { italic = false }
        })
        vim.cmd.colorscheme("rose-pine")
    end,
}
