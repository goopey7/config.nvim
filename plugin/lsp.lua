vim.keymap.set("n", "grn", vim.lsp.buf.rename)
vim.keymap.set("n", "gra", vim.lsp.buf.code_action)
vim.keymap.set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
vim.keymap.set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
vim.keymap.set("n", "<leader>F", vim.lsp.buf.format)

vim.diagnostic.config({ underline = false })

local ivy = require("telescope.themes").get_ivy()
local builtin = require("telescope.builtin")
vim.keymap.set("n", "gd", function() builtin.lsp_definitions(ivy) end)
vim.keymap.set("n", "grr", function() builtin.lsp_references(ivy) end)
vim.keymap.set("n", "gt", function() builtin.lsp_workspace_symbols(ivy) end)

