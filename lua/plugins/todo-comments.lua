return {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {},
    keys = {
        { "<leader>td", "<cmd>TodoTrouble toggle focus=true<CR>" }
    }
}

