return {
  "jakemason/ouroboros.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  ft = {"cpp"},
  config = function()
    vim.keymap.set("n", "<leader>v", "<cmd>Ouroboros<CR>")
  end
}
