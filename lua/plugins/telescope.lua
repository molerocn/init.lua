return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    branch='master',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        -- optional but recommended
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    config = function()
        -- local trouble = require("trouble.sources.telescope")
        local builtin = require("telescope.builtin")

        require("telescope").setup({ defaults = { mappings = { i = { ["<C-u>"] = false } }, }, })

        vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
        vim.keymap.set("n", "<C-p>", builtin.git_files, {})
        vim.keymap.set("n", "<leader>ps", function()
            builtin.grep_string({ search = vim.fn.input("Grep > "), use_regex = true })
        end)
    end,
}
