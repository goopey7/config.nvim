local function on_jump(diagnostic)
	if not diagnostic then return end
	vim.schedule(function()
		vim.diagnostic.open_float(nil, { focus = false, scope = "cursor" })
	end)
end
vim.diagnostic.config({ underline = true, float = { source = true, border = "rounded" }, jump = { on_jump = on_jump } })

vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(ev)
		local client = vim.lsp.get_client_by_id(ev.data.client_id)
		if client then
			if client:supports_method("textDocument/completion") then
				vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
			end
			if client.name == "clangd" then
				local opts = { buffer = ev.buf, silent = true }
				vim.keymap.set("n", "gi", "<cmd>LspClangdSwitchSourceHeader<cr>",
					vim.tbl_extend("force", opts, { desc = "Switch Source/Header" }))
			end
		end
	end
})
vim.cmd("set completeopt+=noselect")

vim.lsp.config("lua_ls", {
	settings = {
		Lua = {
			workspace = {
				library = vim.api.nvim_get_runtime_file("", true)
			}
		}
	}
})

vim.lsp.config("clangd", {
	cmd = {
		"clangd",
		"--background-index",
		"--clang-tidy",
		"--completion-style=detailed",
		"--header-insertion=iwyu",
		"--header-insertion-decorators",
		"--function-arg-placeholders",
		"--fallback-style=llvm",
		"--pch-storage=memory",
		"-j=4",
		"--all-scopes-completion",
		"--cross-file-rename",
		"--suggest-missing-includes",
		"--ranking-model=decision_forest",
	},
	filetypes = { "c", "cpp", "objc", "objcpp", "cuda", "proto" },
	root_markers = {
		".clangd",
		".clang-tidy",
		".clang-format",
		"compile_commands.json",
		"compile_flags.txt",
		".git"
	},
	capabilities = {
		offsetEncoding = { "utf-16" },
	},
	init_options = {
		clangdFileStatus = true,
		usePlaceholders = true,
		completeUnimported = true,
		semanticHighlighting = true,
	},
})

vim.lsp.config("zls", {
	cmd = { "zls" },
	settings = {
		zls = {
			enable_build_on_save = true,
		},
	},
});

vim.lsp.enable({ "lua_ls", "clangd", "csharp_ls", "cmake", "rust_analyzer", "zls", "tinymist" })
