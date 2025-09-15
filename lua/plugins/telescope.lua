return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.5",
    cmd = "Telescope",
    dependencies = { "nvim-lua/plenary.nvim" },
    lazy = false,
    config = function()
        local trouble = require("trouble.sources.telescope")
        local builtin = require("telescope.builtin")

        require("telescope").setup({
            defaults = {
                mappings = {
                    n = { ["<C-t>"] = trouble.open },
                    i = {
                        ["<C-u>"] = false,
                        ["<C-t>"] = trouble.open
                    }
                },
            },
        })

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({
                search = vim.fn.input("Grep > "),
                use_regex = true
            })
        end)
    end,
}
