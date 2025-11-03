return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    dependencies = {
        "projekt0n/github-nvim-theme",
        "catppuccin/nvim",
        "ellisonleao/gruvbox.nvim",
    },
    priority = 1000,
    config = function()
        local utils = require("utils")
        require('catppuccin').setup({
            transparent_background = true
        })

        require('rose-pine').setup({
            disable_background = true,
            styles = {
                italic = false, },
        })

        require('gruvbox').setup({
            transparent_mode = true
        })

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

        vim.cmd("colorscheme gruvbox")

        local dark_mode = function()
            vim.cmd("set background=dark")
        end

        local light_mode = function()
            vim.cmd("set background=light")
        end

        local refresh = function()
            local theme = utils.get_system_theme()
            if theme == "dark" then
                dark_mode()
            else
                light_mode()
            end
        end

        refresh()
        vim.keymap.set("n", "<leader>th", function()
            refresh()
        end)
    end
}
