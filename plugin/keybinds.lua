local set = vim.keymap.set

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
