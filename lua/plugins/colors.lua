return {
    "craftzdog/solarized-osaka.nvim",
    lazy = false,
    priority = 1000,
    dependencies = {
        "projekt0n/github-nvim-theme",
    },
    config = function()
        -- function Dark()
        --     vim.cmd.colorscheme("solarized-osaka")
        -- end

        -- function Light()
        --     vim.cmd.colorscheme("github_light")
        -- end

        require("solarized-osaka").setup({
            transparent = false,
           -- on_colors = function(colors)
           --     colors.bg = "#101A1A"
           -- end
        })
        local hora = os.date("*t").hour
        local colorScheme

        if hora >= 17 or hora < 6 then
            colorScheme = "solarized-osaka"
        else
            colorScheme = "github_light"
        end
        vim.cmd.colorscheme(colorScheme)
    end,
}
