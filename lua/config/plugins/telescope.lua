local builtin = require "telescope.builtin"

return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
  },
  keys = {
    { "<leader>f", builtin.find_files, desc = "Find files" },
  },
}
