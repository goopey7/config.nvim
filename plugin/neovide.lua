if vim.g.neovide then
	vim.g.neovide_cursor_animation_length = 0
	vim.g.neovide_position_animation_length = 0
	vim.g.neovide_scroll_animation_length = 0
	vim.g.neovide_scroll_animation_far_lines = 0
	vim.o.guifont = "Source Code Pro:h16"
	vim.keymap.set("n", "<F11>", function() vim.g.neovide_fullscreen = not vim.g.neovide_fullscreen end)
end
