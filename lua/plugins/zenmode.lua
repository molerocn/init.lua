return {
    "folke/zen-mode.nvim",
    lazy = false,
    opts = {},
    config = function()
        vim.keymap.set("n", "<leader>z", function()
            require("zen-mode").toggle({
                window = {
                    width = .65
                }
            })
        end)
    end
}
