return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
        local builtin = require("telescope.builtin")

        require("telescope").setup({
            defaults = {
                mappings = { i = { ["<C-u>"] = false, } },
            },
        })

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") })
        end)
    end,
}
