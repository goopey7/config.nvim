local function on_jump(diagnostic)
	if not diagnostic then return end
	vim.schedule(function()
		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
	end)
end
vim.diagnostic.config({ underline = true, float = { source = "always", border = "rounded" }, jump = { on_jump = on_jump } })

vim.keymap.set("n", "gf", vim.lsp.buf.format)
vim.keymap.set("n", "gj", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end)
vim.keymap.set("n", "gk", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end)
vim.keymap.set("n", "gl", function() vim.diagnostic.jump({ count = 1 }) end)
vim.keymap.set("n", "gh", function() vim.diagnostic.jump({ count = -1 }) end)
vim.keymap.set("n", "gd", function() vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" }) end)
