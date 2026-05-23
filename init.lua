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
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
})

vim.cmd("colorscheme carbonfox")

require "oil_config"
require "fff_config"
require "telescope_config"
require "terminal_config"
require "lsp_config"
require "quicker_config"
require "lazygit"
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>fd', function() require('fff').find_files() end, { desc = 'Find files' })
vim.keymap.set('n', '<leader>fl', function() require('fff').live_grep({ grep = { modes = { 'fuzzy', 'plain' } } }) end,
	{ desc = 'Live Grep' })
vim.keymap.set("n", "-", ":Oil<CR>")
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Buffers' })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Help tags' })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Help tags' })
vim.keymap.set('n', '<leader>fm', function()
	builtin.man_pages({ sections = { '1', '2', '3', '6' } })
end, { desc = 'Man pages' })
vim.keymap.set('n', 'gt', builtin.lsp_workspace_symbols, { desc = 'LSP workspace symbols' })
vim.keymap.set('n', 'grr', builtin.lsp_references, { desc = 'LSP references' })
vim.keymap.set("n", "<leader>c", vim.lsp.buf.format, { desc = 'Format file' })
vim.keymap.set("v", "<leader>c", function()
	vim.lsp.buf.format({
		range = {
			["start"] = vim.api.nvim_buf_get_mark(0, "<"),
			["end"] = vim.api.nvim_buf_get_mark(0, ">"),
		},
		async = true,
	})
end, { desc = 'Format selection' })
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
