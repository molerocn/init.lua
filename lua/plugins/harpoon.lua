return {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = { settings = { save_on_toggle = true } },
    keys = function()
        local harpoon = require("harpoon")
        return {
            { "<leader>a", function() harpoon:list():add() end },
            { "<C-e>", mode = { 'n', 'v' }, function() harpoon.ui:toggle_quick_menu(harpoon:list()) end },
            { "<C-h>", function() harpoon:list():select(1) end },
            { "<C-t>", function() harpoon:list():select(2) end },
            { "<C-n>", function() harpoon:list():select(3) end },
            { "<C-m>", function() harpoon:list():select(4) end },
        }
    end
} 
