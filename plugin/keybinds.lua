local set = vim.keymap.set
local k = vim.keycode
local f = require "config.f"
local fn = f.fn

-- split navigation
set("n", "<leader>j", "<c-w><c-j>")
set("n", "<leader>k", "<c-w><c-k>")
set("n", "<leader>l", "<c-w><c-l>")
set("n", "<leader>h", "<c-w><c-h>")

-- size of splits (height/width)
set("n", "<M-,>", "<c-w>5<")
set("n", "<M-.>", "<c-w>5>")
set("n", "<M-k>", "<C-W>+")
set("n", "<M-j>", "<C-W>-")

-- buffers
set("n", "<leader>w", "<cmd>bd<CR>")
set("n", "<c-l>", "<cmd>bnext<CR>")
set("n", "<c-h>", "<cmd>bprev<CR>")

-- lsp bindings
set("n", "K", vim.lsp.buf.hover, { buffer = 0 })
set("n", "gd", vim.lsp.buf.definition, { buffer = 0 })
set("n", "gi", vim.lsp.buf.implementation, { buffer = 0 })
set("n", "gt", vim.lsp.buf.type_definition, { buffer = 0 })
set("n", "<leader><cr>", vim.lsp.buf.code_action, { buffer = 0 })
set("v", "<leader><cr>", vim.lsp.buf.code_action, { buffer = 0 })
set("n", "<leader>rn", vim.lsp.buf.rename, { buffer = 0 })
set("n", "<leader>dj", vim.diagnostic.goto_next, { buffer = 0 })
set("n", "<leader>dk", vim.diagnostic.goto_prev, { buffer = 0 })
set("n", "dk", fn(vim.diagnostic.jump, { count = 1, float = true }))
set("n", "dj", fn(vim.diagnostic.jump, { count = -1, float = true }))
