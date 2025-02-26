vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- search settings
vim.opt.smartcase = true
vim.opt.ignorecase = true
vim.opt.hlsearch = false

-- line number settings
vim.opt.number = true
vim.opt.relativenumber = true

-- Don't have `o` add a comment
vim.opt.formatoptions:remove "o"

vim.opt.wrap = false
vim.opt.linebreak = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

vim.opt.errorbells = false

vim.opt.swapfile = false

vim.opt.hidden = true

vim.opt.expandtab = false
