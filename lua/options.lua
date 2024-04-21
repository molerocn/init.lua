local opt = vim.opt
local cmd = vim.cmd

-- options
opt.guicursor = ""
opt.nu = true
opt.relativenumber = true
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true
opt.hlsearch = false
opt.incsearch = true
opt.termguicolors = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.updatetime = 50
opt.colorcolumn = "80"
opt.splitright = true
opt.ignorecase = true
opt.smartcase = true

-- netrw
vim.g.netrw_browse_split = 0
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 25
cmd("au FileType netrw nmap <buffer> a %")
cmd("au FileType netrw nmap <buffer> h -")
cmd("au FileType netrw nmap <buffer> r R")
cmd("au FileType netrw nmap <buffer> v <nop>")
cmd("au FileType netrw nmap <buffer> s <nop>")
cmd("au FileType netrw nmap <buffer> o <nop>")
cmd("au FileType netrw nmap <buffer> t <nop>")
cmd("au FileType netrw nmap <buffer> p <nop>")
cmd("au FileType netrw nmap <buffer> u <nop>")
cmd("au FileType netrw nmap <buffer> i <nop>")
cmd("set background=dark")
cmd [[let g:copilot_no_tab_map = v:true]]
cmd [[let g:copilot_filetypes = {
	      \ 'markdown': v:false,
	      \ 'text': v:false,
	      \ }]]

vim.api.nvim_create_autocmd('TextYankPost', {
    group = vim.api.nvim_create_augroup('juancamr-highlight-yank', { clear = true }),
    callback = function()
        vim.highlight.on_yank({
            higroup = "IncSearch",
            timeout = 40,
        })
    end,
})



