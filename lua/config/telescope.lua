local telescope = require("telescope")

local config = {
  defaults = {
    file_ignore_patterns = {
      "Binaries/*",
      "Content/*",
      "Intermediate/*",
      "obj/*",
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
telescope.load_extension("unreal")
telescope.load_extension("fzf")
telescope.load_extension("ui-select")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>fd", builtin.find_files)
vim.keymap.set("n", "<leader>fb", builtin.buffers)
