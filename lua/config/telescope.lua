require("telescope").setup
{
	defaults = {
		file_ignore_patterns = {
			"Binaries/*",
			"Content/*",
			"Intermediate/*",
		},
	},
	extensions = {
		fzf = {},
	},
}

pcall(require("telescope").load_extension, "fzf")
