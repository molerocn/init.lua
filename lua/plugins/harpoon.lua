return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
        local harpoon = require("harpoon")

        harpoon:setup({ settings = { save_on_toggle = true } })

        vim.keymap.set("n", "<leader>h", function()
            harpoon:list():append()
        end)
        vim.keymap.set({"n", "v"}, "<C-e>", function()
            harpoon.ui:toggle_quick_menu(harpoon:list())
        end)
        vim.keymap.set({"n", "v"}, "<C-h>", function()
            harpoon:list():select(1)
        end)
        vim.keymap.set({"n", "v"}, "<C-t>", function()
            harpoon:list():select(2)
        end)
        vim.keymap.set({"n", "v"}, "<C-n>", function()
            harpoon:list():select(3)
        end)
        vim.keymap.set({"n", "v"}, "<C-m>", function()
            harpoon:list():select(4)
        end)
    end,
}
