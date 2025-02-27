vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev)

vim.diagnostic.config({ underline = false })

vim.keymap.set("n", "gd", "<cmd>Tele lsp_definitions<CR>")
vim.keymap.set("n", "grr", "<cmd>Tele lsp_references<CR>")
vim.keymap.set("n", "gt", "<cmd>Tele lsp_dynamic_workspace_symbols<CR>")


 vim.api.nvim_create_autocmd("LspAttach", {
 	group = vim.api.nvim_create_augroup("lsp", { clear = true }),
 	callback = function(args)
 		vim.api.nvim_create_autocmd("BufWritePre", {
 			buffer = args.buf,
 			callback = function()
 				vim.lsp.buf.format { async = false, id = args.data.client_id }
 			end,
 		})
 	end
 })
