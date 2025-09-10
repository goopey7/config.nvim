local function on_jump(diagnostic)
	if not diagnostic then return end
	vim.schedule(function()
		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
	end)
end
vim.diagnostic.config({ underline = true, float = { source = true, border = "rounded" }, jump = { on_jump = on_jump } })

vim.keymap.set("n", "gf", vim.lsp.buf.format)
vim.keymap.set("n", "gj", function() vim.diagnostic.jump({ count = 1, severity = vim.diagnostic.severity.ERROR }) end)
vim.keymap.set("n", "gk", function() vim.diagnostic.jump({ count = -1, severity = vim.diagnostic.severity.ERROR }) end)
vim.keymap.set("n", "gl", function() vim.diagnostic.jump({ count = 1 }) end)
vim.keymap.set("n", "gh", function() vim.diagnostic.jump({ count = -1 }) end)
vim.keymap.set("n", "gd", function() vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" }) end)

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client then
			if client:supports_method("textDocument/completion") then
				vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			end
		end
	end
})
vim.cmd("set completeopt+=noselect")

require('lspconfig').lua_ls.setup {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
}

vim.lsp.enable({ "clangd" })
