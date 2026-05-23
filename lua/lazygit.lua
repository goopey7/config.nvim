vim.keymap.set("n", "<leader>g", function()
	local buf = vim.api.nvim_create_buf(false, true);
	local width = vim.o.columns;
	local height = vim.o.lines;

	local win = vim.api.nvim_open_win(buf, true, {
		relative = 'editor',
		width = width,
		height = height,
		row = 0,
		col = 0,
		style = 'minimal',
		border = 'none',
	})

	vim.fn.jobstart("lazygit", { term = true })
	vim.cmd.startinsert()

	vim.api.nvim_create_autocmd("TermClose", {
		buffer = buf,
		once = true,
		callback = function()
			vim.schedule(function()
				if vim.api.nvim_win_is_valid(win) then
					vim.api.nvim_win_close(win, true)
				end
			end)
		end,
	})
end)
