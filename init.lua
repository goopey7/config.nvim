vim.o.autocomplete = true
vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, {autotrigger = true})
		end
	end,
})
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
	"https://github.com/EdenEast/nightfox.nvim",
	"https://github.com/stevearc/quicker.nvim",
vim.cmd("colorscheme carbonfox")
})
require "oil_config"
require "terminal_config"
vim.keymap.set("n", "-", ":Oil<CR>")
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
