require('telescope').setup({
	defaults = {
		file_ignore_patterns = {},
		color_devicons = false,
		sorting_strategy = 'ascending',
		borderchars = { '', '', '', '', '', '', '', '', },
		path_displays = 'smart',
		layout_strategy = 'horizontal',
		layout_config = {
			height = 400,
			width = 400,
			prompt_position = 'top',
		},
	},
})

vim.api.nvim_create_autocmd('FileType', {
	pattern = 'TelescopePrompt',
	command = 'setlocal complete=',
})
