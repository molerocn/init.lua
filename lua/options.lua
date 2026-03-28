vim.opt.nu = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.wrap = false
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.writebackup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.termguicolors = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"
vim.opt.splitright = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25

-- yank animation
vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('molerocn-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank({ higroup = "IncSearch", timeout = 40 })
    end,
})

-- remember cursor position
vim.api.nvim_create_autocmd("BufReadPost", {
    callback = function()
        local last_pos = vim.fn.line([['"]])
        if last_pos > 0 and last_pos <= vim.fn.line("$") then
            vim.schedule(function()
                vim.cmd('normal! g`"zz')
            end)
        end
    end
})

vim.cmd("colorscheme rose-pine")
