-- bindings for executing lua in neovim
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>")
vim.keymap.set("n", "<leader>x", "<cmd>.lua<CR>")
vim.keymap.set("v", "<leader>x", ":'<,'>lua<CR>")

local opt = vim.opt_local;
opt.shiftwidth = 2
