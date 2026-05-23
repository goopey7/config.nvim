vim.o.autocomplete = true
vim.opt.complete:append('o')
vim.opt.completeopt = { 'menuone', 'noselect', 'fuzzy' }
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
vim.o.autoread = true
vim.g.statusline = 0

vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/EdenEast/nightfox.nvim",
	"https://github.com/stevearc/quicker.nvim",
	"https://github.com/dmtrKovalenko/fff.nvim",
})

vim.cmd("colorscheme carbonfox")

require "oil_config"
require "fff_config"
require "terminal_config"
require "lsp_config"
require "quicker_config"
require "lazygit"
vim.keymap.set('n', '<leader>fd', function() require('fff').find_files() end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fl', function() require('fff').live_grep() end, { desc = 'Live Grep' })
vim.keymap.set("n", "-", ":Oil<CR>")
vim.keymap.set("n", "<leader>b", ":ls<CR>:b ", { desc = "Switch buffer" })
vim.keymap.set("n", "<leader>fh", ":help ", { desc = "Help tags" })
vim.keymap.set("n", "gt", vim.lsp.buf.workspace_symbol, { desc = "Workspace symbols" })
vim.keymap.set("n", "grr", vim.lsp.buf.references, { desc = "LSP references" })
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gf", vim.lsp.buf.format)
vim.keymap.set("n", "gj", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end)
vim.keymap.set("n", "gk", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end)
vim.keymap.set("n", "gl", function() vim.diagnostic.jump({ count = 1 }) end)
vim.keymap.set("n", "gh", function() vim.diagnostic.jump({ count = -1 }) end)
vim.keymap.set("n", "<leader>q", function()
	require("quicker").toggle()
end, {
	desc = "Toggle quickfix",
})
vim.keymap.set("n", "<leader>l", function()
	require("quicker").toggle({ loclist = true })
end, {
	desc = "Toggle loclist",
})
