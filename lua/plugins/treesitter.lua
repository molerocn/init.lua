return {
     "nvim-treesitter/nvim-treesitter",
     build = ":TSUpdate",
     lazy = false,
     opts = {
         ensure_installed = { "python", "markdown", "lua" },
         sync_install = false,
         highlight = { enable = true },
         indent = { enable = true },
     } 
}
