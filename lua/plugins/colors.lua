return {
    "rose-pine/neovim",
    name = "rose-pine",
    lazy = false,
    dependencies = {
        "projekt0n/github-nvim-theme",
    },
    config = function()
        require('rose-pine').setup({
            disable_background = true,
            styles = {
                italic = false,
            },
        })
        -- by default
        local set_default_colorscheme = function()
            vim.cmd("colorscheme rose-pine")
            vim.cmd("set background=dark")
        end
        set_default_colorscheme()

        vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
        vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

        vim.keymap.set("n", "<leader>th", function()
            if (vim.g.colors_name == "rose-pine") then
                vim.cmd("colorscheme github_light")
            else
                set_default_colorscheme()
            end
        end)
    end
}
