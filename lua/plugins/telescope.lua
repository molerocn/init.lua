return {
    'nvim-telescope/telescope.nvim',
    version = '*',
    branch='master',
    lazy = false,
    dependencies = {
        'nvim-lua/plenary.nvim',
        { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
    },
    opts = { defaults = { mappings = { i = { ["<C-u>"] = false } } } },
    keys = {
        { "<leader>ps", function()
            require('telescope.builtin').grep_string({
                search = vim.fn.input("Grep > "), use_regex = true })
        end },
        { "<leader>pf", "<cmd>Telescope find_files<CR>" },
        { "<C-p>", "<cmd>Telescope git_files<CR>" }
    }
}
