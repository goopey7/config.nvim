vim.g.mapleader = " "
vim.o.signcolumn = "yes"
vim.o.wrap = false
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.swapfile = false
vim.o.errorbells = false
vim.o.hidden = true
vim.o.expandtab = false
vim.o.winborder = "rounded"
vim.o.smartcase = true
vim.o.ignorecase = true
vim.o.hlsearch = false
vim.g.statusline = 0
vim.cmd("set laststatus=0")
vim.opt.formatoptions:remove "o"

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "-", ":Oil<CR>")
vim.keymap.set("n", "<leader>fd", ":Pick files<CR>")
vim.keymap.set("n", "<leader>fb", ":Pick buffers<CR>")
vim.keymap.set("n", "<leader>fl", ":Pick grep_live<CR>")
vim.keymap.set("n", "<leader>fh", ":Pick help<CR>")
vim.keymap.set("n", "<leader>g", ":LazyGit<CR>")

vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/nvim-mini/mini.pick",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/kdheepak/lazygit.nvim",
	"https://github.com/EdenEast/nightfox.nvim",
})

require "mini.pick".setup()
require "oil_config"
require "lsp_config"
vim.cmd("colorscheme carbonfox")
