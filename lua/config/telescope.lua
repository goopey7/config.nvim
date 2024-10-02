require("telescope").setup
{
	defaults = {
		file_ignore_patterns = {
			"Binaries/*",
			"Content/*",
			"Intermediate/*",
			".git/*",
		},
	},
	extensions = {
		fzf = {},
	},
}

pcall(require("telescope").load_extension, "fzf")
