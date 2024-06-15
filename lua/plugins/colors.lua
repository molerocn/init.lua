return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    priority = 1000,
    dependencies = {
        "ellisonleao/gruvbox.nvim"
    },
    config = function()
        require("gruvbox").setup()
        require("rose-pine").setup({
            disable_background = true,
            styles = { italic = false }
        })
        vim.cmd.colorscheme("gruvbox")
    end,
}
