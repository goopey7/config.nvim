vim.api.nvim_create_autocmd('LspAttach', {
	callback = function(ev)
		local client = assert(vim.lsp.get_client_by_id(ev.data.client_id))
		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
		end
		if client.name == "clangd" then
			local opts = { buffer = ev.buf, silent = true }
			vim.keymap.set("n", "gi", "<cmd>LspClangdSwitchSourceHeader<cr>",
				vim.tbl_extend("force", opts, { desc = "Switch Source/Header" }))
		end
	end,
})

local function on_jump(diagnostic)
	if not diagnostic then return end
	vim.schedule(function()
		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
	end)
end
vim.diagnostic.config({ underline = true, float = { source = true, border = "rounded" }, jump = { on_jump = on_jump } })

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
})
vim.lsp.enable({ "lua_ls" })
