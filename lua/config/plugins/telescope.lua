local builtin = require "telescope.builtin"

return {
	"nvim-telescope/telescope.nvim",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		{ "nvim-telescope/telescope-fzf-native.nvim", run = "make" },
	},
	keys = {
		{ "<leader>f", builtin.find_files, desc = "Find files" },
	},
	config = function()
		require "config.telescope"
	end,
}
