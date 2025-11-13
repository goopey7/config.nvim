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

vim.pack.add({
	"https://github.com/stevearc/oil.nvim",
	"https://github.com/neovim/nvim-lspconfig",
	"https://github.com/EdenEast/nightfox.nvim",
	"https://github.com/nvim-lua/plenary.nvim",
	"https://github.com/nvim-telescope/telescope.nvim",
	"https://github.com/nvim-treesitter/nvim-treesitter",
})

require "oil_config"
require "lsp_config"

require "telescope".setup({
	defaults = {
		color_devicons = false,
		sorting_strategy = "ascending",
		borderchars = { "", "", "", "", "", "", "", "", },
		path_displays = "smart",
		layout_strategy = "horizontal",
		layout_config = {
			height = 400,
			width = 400,
			prompt_position = "top",
		}
	}
})
local builtin = require "telescope.builtin"

vim.cmd("colorscheme carbonfox")

vim.keymap.set("n", "<leader>g", function()
	local buf = vim.api.nvim_create_buf(false, true);
	local width = vim.o.columns;
	local height = vim.o.lines;

	local win = vim.api.nvim_open_win(buf, true, {
		relative = 'editor',
		width = width,
		height = height,
		row = 0,
		col = 0,
		style = 'minimal',
		border = 'none',
	})

	vim.fn.jobstart("lazygit", { term = true })
	vim.cmd.startinsert()

	vim.api.nvim_create_autocmd("TermClose", {
		buffer = buf,
		once = true,
		callback = function()
			vim.schedule(function()
				if vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_win_close(win, true)
				end
			end)
		end,
	})
end)

vim.keymap.set("n", "<leader>o", ":update<CR> :source<CR>")
vim.keymap.set("n", "-", ":Oil<CR>")
vim.keymap.set("n", "<leader>fd", builtin.find_files)
vim.keymap.set("n", "<leader>fb", builtin.builtin)
vim.keymap.set("n", "<leader>b", builtin.buffers)
vim.keymap.set("n", "<leader>fl", builtin.live_grep)
vim.keymap.set("n", "<leader>fh", builtin.help_tags)
vim.keymap.set("n", "gt", builtin.lsp_workspace_symbols)
vim.keymap.set("n", "grr", builtin.lsp_references)
vim.keymap.set("n", "gd", vim.lsp.buf.definition)
vim.keymap.set("n", "gD", vim.lsp.buf.declaration)
vim.keymap.set("n", "gf", vim.lsp.buf.format)
vim.keymap.set("v", "gf", function()
	vim.lsp.buf.format({
		range = {
			["start"] = vim.api.nvim_buf_get_mark(0, "<"),
			["end"] = vim.api.nvim_buf_get_mark(0, ">"),
		},
		async = true,
	})
end, { desc = "Format selection" })
vim.keymap.set("n", "gj", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end)
vim.keymap.set("n", "gk", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end)
vim.keymap.set("n", "gl", function() vim.diagnostic.jump({ count = 1 }) end)
vim.keymap.set("n", "gh", function() vim.diagnostic.jump({ count = -1 }) end)
vim.keymap.set("n", "gi", function() vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" }) end)
