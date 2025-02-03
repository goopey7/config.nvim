local telescope = require("telescope")

local config = {
  defaults = {
    file_ignore_patterns = {
      "Binaries/*",
      "Content/*",
      "Intermediate/*",
      ".git/*",
    },
  },
  pickers = {
    find_files = {
      theme = "ivy",
    },
    buffers = {
      theme = "ivy",
    },
  },
  extensions = {
    ["ui-select"] = {
      require("telescope.themes").get_ivy(),
    },
  },
}

telescope.setup(config)
telescope.load_extension("fzf")
telescope.load_extension("ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fd", builtin.find_files)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
vim.keymap.set("n", "gd", builtin.lsp_definitions)
vim.keymap.set("n", "grr", builtin.lsp_references)
vim.keymap.set("n", "gt", builtin.lsp_workspace_symbols)
