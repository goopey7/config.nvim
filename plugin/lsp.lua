vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename)
vim.keymap.set("n", "<leader>a", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next)
vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev)

vim.diagnostic.config({ underline = false })

vim.keymap.set("n", "gd", "<cmd>Tele lsp_definitions<CR>")
vim.keymap.set("n", "grr", "<cmd>Tele lsp_references<CR>")
vim.keymap.set("n", "gt", "<cmd>Tele lsp_dynamic_workspace_symbols<CR>")
vim.keymap.set("n", "gf", vim.lsp.buf.format)
vim.keymap.set("v", "gf", vim.lsp.buf.format)
